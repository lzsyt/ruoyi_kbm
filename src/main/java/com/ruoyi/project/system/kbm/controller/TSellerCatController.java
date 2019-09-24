package com.ruoyi.project.system.kbm.controller;

import java.util.List;

import com.ruoyi.framework.web.domain.Ztree;
import com.ruoyi.project.system.kbm.domain.KnowledgeGoodlinkCatMap;
import com.ruoyi.project.system.kbm.domain.TSellerCat;
import com.ruoyi.project.system.kbm.service.ITSellerCatService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
@Controller
@RequestMapping("/system/cat")
public class TSellerCatController extends BaseController
{
    private String prefix = "system/cat";

    @Autowired
    private ITSellerCatService tSellerCatService;

    @RequestMapping("/treeData/{shopId}")
    @ResponseBody
    private List<Ztree> getCatByShopId(@PathVariable String shopId){
        List<Ztree> ztreeList = tSellerCatService.getTree(shopId);
        return ztreeList;
    }



    @RequiresPermissions("system:cat:view")
    @GetMapping()
    public String cat()
    {
        return prefix + "/cat";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:cat:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TSellerCat tSellerCat)
    {
        startPage();
        List<TSellerCat> list = tSellerCatService.selectTSellerCatList(tSellerCat);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:cat:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TSellerCat tSellerCat)
    {
        List<TSellerCat> list = tSellerCatService.selectTSellerCatList(tSellerCat);
        ExcelUtil<TSellerCat> util = new ExcelUtil<TSellerCat>(TSellerCat.class);
        return util.exportExcel(list, "cat");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("system:cat:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TSellerCat tSellerCat)
    {
        return toAjax(tSellerCatService.insertTSellerCat(tSellerCat));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{cid}")
    public String edit(@PathVariable("cid") Long cid, ModelMap mmap)
    {
        TSellerCat tSellerCat = tSellerCatService.selectTSellerCatById(cid);
        mmap.put("tSellerCat", tSellerCat);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:cat:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TSellerCat tSellerCat)
    {
        return toAjax(tSellerCatService.updateTSellerCat(tSellerCat));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:cat:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tSellerCatService.deleteTSellerCatByIds(ids));
    }
}
