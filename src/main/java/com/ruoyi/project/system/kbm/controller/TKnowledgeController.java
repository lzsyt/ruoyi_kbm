package com.ruoyi.project.system.kbm.controller;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.kbm.domain.TKnowledge;
import com.ruoyi.project.system.kbm.domain.TKnownledgeFile;
import com.ruoyi.project.system.kbm.service.ITKnowledgeService;
import com.ruoyi.project.system.kbm.service.ITKnownledgeFileService;
import com.ruoyi.project.system.kbm.service.ITKnownledgeSortService;
import com.ruoyi.project.system.kbm.service.ITOrgService;
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

    @RequiresPermissions("system:knowledge:view")
    @GetMapping()
    public String knowledge(ModelMap modelMap) {
        modelMap.put("sorts", tKnownledgeSortService.selectTKnownledgeSortList(null));
        modelMap.put("orgs", tOrgService.getChild(tOrgService.selectTOrgList(null)));
        return prefix + "/knowledge";
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
        for (TKnowledge knowledge:tKnowledgeList) {
            if (knowledge.getFiles() != null && knowledge.getFiles().size() != 0) {
                for (TKnownledgeFile file : knowledge.getFiles()) {
                    if (file.getFileType() == 1L) {
                        knowledge.setImagePath(file.getFilePath());
                        break;
                    }
                }
            }

        }

        return getDataTable(tKnowledgeList);
    }

    /**
     * 导出知识库列表
     */
    @RequiresPermissions("system:knowledge:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TKnowledge tKnowledge) {
        List<TKnowledge> list = tKnowledgeService.selectTKnowledgeList(tKnowledge);
        ExcelUtil<TKnowledge> util = new ExcelUtil<TKnowledge>(TKnowledge.class);
        return util.exportExcel(list, "knowledge");
    }

    /**
     * 新增知识库
     */
    @GetMapping("/add")
    public String add(ModelMap modelMap) {
        modelMap.put("sorts", tKnownledgeSortService.selectTKnownledgeSortList(null));
        modelMap.put("orgs", tOrgService.getChild(tOrgService.selectTOrgList(null)));
        modelMap.put("tKnowledge", tKnowledgeService.selectTKnowledgeRecent());
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
                              @RequestParam("file") MultipartFile[] file) {
        TKnowledge tKnowledge = new TKnowledge();

        tKnowledge.setProductName(productName);
        tKnowledge.setShopNum(shopNum);
        tKnowledge.setSort(sort);
        tKnowledge.setProductFactory(productFactory);
        tKnowledge.setAsk(ask);
        tKnowledge.setAnswer(answer);
        tKnowledge.setDataOrg(dataOrg);

        return toAjax(tKnowledgeService.insertTKnowledge(tKnowledge, file));
    }


    /**
     * 修改知识库
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap) {
        TKnowledge tKnowledge = tKnowledgeService.selectTKnowledgeById(id);
        mmap.put("tKnowledge", tKnowledge);
        mmap.put("sorts", tKnownledgeSortService.selectTKnownledgeSortList(null));
        mmap.put("orgs", tOrgService.getChild(tOrgService.selectTOrgList(null)));
        return prefix + "/edit";
    }

    /**
     * 修改保存知识库
     */
    @RequiresPermissions("system:knowledge:edit")
    @Log(title = "知识库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TKnowledge tKnowledge, MultipartFile[] file) {
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
        String filePath = "D:/res/"+ strZipPath.substring(0, strZipPath.lastIndexOf("/"));

        HttpHeaders headers = new HttpHeaders();
        File file = new File(filePath + "/" + fileName);

        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);

        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

    @RequestMapping("delfile")
    @ResponseBody
    public String delFile(@RequestParam("id")String id){
        return knownledgeFileService.deleteTKnownledgeFileById(id) > 0 ? "0" : "1";
    }


}
