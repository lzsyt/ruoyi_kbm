package com.ruoyi.project.system.kbm.controller;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.kbm.domain.*;
import com.ruoyi.project.system.kbm.service.*;
import com.ruoyi.project.system.kbm.service.impl.TProductFactoryServiceImpl;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 知识库Controller
 *
 * @author ruoyi
 * @date 2019-09-19
 */
@Controller
@RequestMapping("/system/knowledge")
public class TKnowledgeController extends BaseController {
    private String prefix = "system/knowledge";


    @Autowired
    private ITProductFactoryService itProductFactoryService;

    @Autowired
    private ITKnowledgeService tKnowledgeService;
    @Autowired
    private ITOrgService tOrgService;
    @Autowired
    private ITKnownledgeSortService tKnownledgeSortService;

    @Autowired
    private ITKnownledgeFileService knownledgeFileService;

    @Autowired
    private ITShopService itShopService;

    @Autowired
    private ITGoodsLinkService tGoodsLinkService;

    @Autowired
    private ITSellerCatService tSellerCatService;


    @RequiresPermissions("system:knowledge:view")
    @GetMapping()
    public String knowledge(ModelMap modelMap) {
        modelMap.put("sorts", tKnownledgeSortService.selectTKnownledgeSortList(null));
        modelMap.put("orgs", tOrgService.selectTOrgList(null));
        modelMap.put("factorys", itProductFactoryService.selectTProductFactoryList(null));
        return prefix + "/knowledge";
    }

    /**
     * 得到图片列表
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("/getimg/{id}")
    @ResponseBody
    public String getimage(@PathVariable("id") String id,ModelMap modelMap){
        TKnowledge knowledge=tKnowledgeService.selectTKnowledgeById(id);
        List<TKnownledgeFile> files=knowledge.getFiles();
        String img="";
        for(TKnownledgeFile file:files){
            if(file.getFileType()==1){
                img+=file.getFilePath()+",";

            }

        }

        return  img;

    }


    /**
     * 查询知识库列表
     */
    @RequiresPermissions("system:knowledge:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TKnowledge tKnowledge) {

        startPage();
        List<TKnowledge> tKnowledgeList = tKnowledgeService.selectTKnowledgeList(tKnowledge);
        return getDataTable(tKnowledgeList);
    }

//
//    /**
//     * 导出知识库列表
//     */
//    @RequiresPermissions("system:knowledge:export")
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(TKnowledge tKnowledge) {
//        List<TKnowledge> list = tKnowledgeService.selectTKnowledgeList(tKnowledge);
//        ExcelUtil<TKnowledge> util = new ExcelUtil<TKnowledge>(TKnowledge.class);
//        return util.exportExcel(list, "knowledge");
//    }

    /**
     * 新增知识库
     */
    @GetMapping("/add")
    public String add(ModelMap modelMap) {
        List<TOrg> tOrgs = tOrgService.getChild(tOrgService.selectTOrgList(null));
        List<TKnownledgeSort> knownledgeSorts = tKnownledgeSortService.selectTKnownledgeSortList(null);
        TKnowledge tKnowledge = tKnowledgeService.selectTKnowledgeRecent();
        if (tKnowledge.getSort() != null) {
            for (TKnownledgeSort knownledgeSort : knownledgeSorts) {
                if (String.valueOf(knownledgeSort.getId()).equals(tKnowledge.getSort())) {
                    tKnowledge.setSortName(knownledgeSort.getSort());
                    break;
                }
            }
        }

        if (tKnowledge.getDataOrg() != null) {
            for (TOrg tOrg : tOrgs) {
                if (tOrg.getDataOrg().equals(tKnowledge.getDataOrg())) {
                    tKnowledge.setOrgName(tOrg.getName());
                    break;
                }
            }
        }
        modelMap.put("tKnowledge", tKnowledge);
        modelMap.put("sorts", knownledgeSorts);
        modelMap.put("orgs", tOrgs);
        modelMap.put("tshop", itShopService.selectTShopList(null));
        modelMap.put("goodlink", tGoodsLinkService.selectTGoodsLinkList(new TGoodsLink()));
        modelMap.put("goodcat", tSellerCatService.selectTSellerCatList(new TSellerCat()));
        modelMap.put("factorys", itProductFactoryService.selectTProductFactoryList(new TProductFactory()));
        return prefix + "/add";
    }

    /**
     * 新增保存知识库
     */
    @RequiresPermissions("system:knowledge:add")
    @Log(title = "知识库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestParam(value = "productName", required = false) String productName,
                              @RequestParam(value = "shopNum", required = false) String shopNum,
                              @RequestParam(value = "sort", required = false) String sort,
                              @RequestParam(value = "productFactory", required = false) String productFactory,
                              @RequestParam(value = "ask", required = false) String ask,
                              @RequestParam(value = "answer", required = false) String answer,
                              @RequestParam(value = "dataOrg", required = false) String dataOrg,
                              @RequestParam(value = "shopId", required = false) String shopid,
                              @RequestParam(value = "goodslinkId", required = false) List<String> goodslinkId,
                              @RequestParam("file") MultipartFile[] file) {
        TKnowledge tKnowledge = new TKnowledge();

        tKnowledge.setProductName(productName);
        tKnowledge.setShopNum(shopNum);
        tKnowledge.setSort(sort);
        tKnowledge.setProductFactory(productFactory);
        tKnowledge.setAsk(ask);
        tKnowledge.setAnswer(answer);
        tKnowledge.setDataOrg(dataOrg);
        if (goodslinkId != null && goodslinkId.size() >0) {
            List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList = new ArrayList<>();
            for (String s : goodslinkId) {
                KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap = new KnowledgeGoodlinkCatMap();
                if (StringUtils.isNotEmpty(shopid)) {
                    knowledgeGoodlinkCatMap.setShopId(Integer.valueOf(shopid));
                }
                if (StringUtils.isNotEmpty(s)) {
                    knowledgeGoodlinkCatMap.setGoodslinkId(Long.valueOf(s));
                }
                knowledgeGoodlinkCatMapList.add(knowledgeGoodlinkCatMap);
            }
            tKnowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMapList);
        }
        return toAjax(tKnowledgeService.insertTKnowledge(tKnowledge, file));
    }


    /**
     * 修改知识库
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap) {
        List<TOrg> tOrgs = tOrgService.getChild(tOrgService.selectTOrgList(null));
        List<TKnownledgeSort> knownledgeSorts = tKnownledgeSortService.selectTKnownledgeSortList(null);
        TKnowledge tKnowledge = tKnowledgeService.selectTKnowledgeById(id);
        if (tKnowledge.getSort() != null) {
            for (TKnownledgeSort knownledgeSort : knownledgeSorts) {
                if (String.valueOf(knownledgeSort.getId()).equals(tKnowledge.getSort())) {
                    tKnowledge.setSortName(knownledgeSort.getSort());
                    break;
                }
            }
        }

        if (tKnowledge.getDataOrg() != null) {
            for (TOrg tOrg : tOrgs) {
                if (tOrg.getDataOrg().equals(tKnowledge.getDataOrg())) {
                    tKnowledge.setOrgName(tOrg.getName());
                    break;
                }
            }
        }
        mmap.put("tKnowledge", tKnowledge);
        mmap.put("sorts", knownledgeSorts);
        mmap.put("orgs", tOrgs);
        mmap.put("tshop", itShopService.selectTShopList(null));
        mmap.put("goodlink", tGoodsLinkService.selectTGoodsLinkList(new TGoodsLink()));
        mmap.put("goodcat", tSellerCatService.selectTSellerCatList(new TSellerCat()));
        mmap.put("factorys", itProductFactoryService.selectTProductFactoryList(new TProductFactory()));
        return prefix + "/edit";
    }

    /**
     * 修改保存知识库
     */
    @RequiresPermissions("system:knowledge:edit")
    @Log(title = "知识库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TKnowledge tKnowledge,
                               @RequestParam(value = "shopId", required = false) String shopid,
                               @RequestParam(value = "goodslinkId", required = false) List<String> goodslinkId,
                               MultipartFile[] file) {
        if (goodslinkId != null && goodslinkId.size() != 0) {
            List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList = new ArrayList<>();
            for (String s : goodslinkId) {
                KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap = new KnowledgeGoodlinkCatMap();
                if (StringUtils.isNotEmpty(shopid)) {
                    knowledgeGoodlinkCatMap.setShopId(Integer.valueOf(shopid));
                }
                if (StringUtils.isNotEmpty(goodslinkId)) {
                    knowledgeGoodlinkCatMap.setGoodslinkId(Long.valueOf(s));
                }
                knowledgeGoodlinkCatMapList.add(knowledgeGoodlinkCatMap);
            }
            tKnowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMapList);
        }
        return toAjax(tKnowledgeService.updateTKnowledge(tKnowledge, file));
    }

    /**
     * 删除知识库
     */
    @RequiresPermissions("system:knowledge:remove")
    @Log(title = "知识库", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(tKnowledgeService.deleteTKnowledgeByIds(ids));
    }

    /**
     * 下载
     * @param strZipPath
     * @return
     * @throws IOException
     */
    @RequestMapping("download")
    public ResponseEntity<byte[]> export(@RequestParam("filePath") String strZipPath) throws IOException {

        String fileName = strZipPath.substring(strZipPath.lastIndexOf("/") + 1);
        String filePath = FileUploadUtils.getDefaultBaseDir() + strZipPath.substring(0, strZipPath.lastIndexOf("/"));
        HttpHeaders headers = new HttpHeaders();
        File file = new File(filePath + "/" + fileName);

        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);

        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }


    /**
     * 删除文件
     * @param id
     * @return
     */
    @RequestMapping("delfile")
    @ResponseBody
    public String delFile(@RequestParam("id") String id) {
        return knownledgeFileService.deleteTKnownledgeFileById(id) > 0 ? "0" : "1";
    }

    public static void main(String[] args) {
        System.out.println("dsadas");
    }


}
