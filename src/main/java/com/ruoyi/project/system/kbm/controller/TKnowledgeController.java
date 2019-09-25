package com.ruoyi.project.system.kbm.controller;

import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.kbm.domain.*;
import com.ruoyi.project.system.kbm.service.*;
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
        modelMap.put("orgs", tOrgService.getChild(tOrgService.selectTOrgList(null)));
        return prefix + "/knowledge";
    }


    @RequestMapping("/getimg/{id}")
    public String getimage(@PathVariable("id") String id, ModelMap modelMap) {
        modelMap.put("tKnowledge", tKnowledgeService.selectTKnowledgeById(id));
        return prefix + "/imag";
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
                              @RequestParam(value = "catId", required = false) String catId,
                              @RequestParam(value = "shopId", required = false) String shopid,
                              @RequestParam(value = "goodslinkId", required = false) String goodslinkId,
                              @RequestParam("file") MultipartFile[] file) {
        TKnowledge tKnowledge = new TKnowledge();

        tKnowledge.setProductName(productName);
        tKnowledge.setShopNum(shopNum);
        tKnowledge.setSort(sort);
        tKnowledge.setProductFactory(productFactory);
        tKnowledge.setAsk(ask);
        tKnowledge.setAnswer(answer);
        tKnowledge.setDataOrg(dataOrg);
        KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap = new KnowledgeGoodlinkCatMap();
        if (shopid != null) {
            knowledgeGoodlinkCatMap.setShopId(Integer.valueOf(shopid));
        }
        if (goodslinkId != null) {
            knowledgeGoodlinkCatMap.setGoodslinkId(Long.valueOf(goodslinkId));
        }
        if (catId != null) {
            knowledgeGoodlinkCatMap.setCatId(Long.valueOf(catId));
        }
        tKnowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMap);
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
        return prefix + "/edit";
    }

    /**
     * 修改保存知识库
     */
    @RequiresPermissions("system:knowledge:edit")
    @Log(title = "知识库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TKnowledge tKnowledge, KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap,
                               MultipartFile[] file) {
        tKnowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMap);
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

    @RequestMapping("delfile")
    @ResponseBody
    public String delFile(@RequestParam("id") String id) {
        return knownledgeFileService.deleteTKnownledgeFileById(id) > 0 ? "0" : "1";
    }


}
