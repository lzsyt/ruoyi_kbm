package com.ruoyi.project.system.kbm.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.kbm.domain.TProductFactory;
import com.ruoyi.project.system.kbm.service.ITProductFactoryService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 生产厂家Controller
 * 
 * @author ruoyi
 * @date 2019-09-28
 */
@Controller
@RequestMapping("/system/factory")
public class TProductFactoryController extends BaseController
{
    private String prefix = "system/factory";

    @Autowired
    private ITProductFactoryService tProductFactoryService;

    @RequiresPermissions("system:factory:view")
    @GetMapping()
    public String factory()
    {
        return prefix + "/factory";
    }

    /**
     * 查询生产厂家列表
     */
    @RequiresPermissions("system:factory:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TProductFactory tProductFactory)
    {
        startPage();
        List<TProductFactory> list = tProductFactoryService.selectTProductFactoryList(tProductFactory);
        return getDataTable(list);
    }

    /**
     * 导出生产厂家列表
     */
    @RequiresPermissions("system:factory:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TProductFactory tProductFactory)
    {
        List<TProductFactory> list = tProductFactoryService.selectTProductFactoryList(tProductFactory);
        ExcelUtil<TProductFactory> util = new ExcelUtil<TProductFactory>(TProductFactory.class);
        return util.exportExcel(list, "factory");
    }

    /**
     * 新增生产厂家
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存生产厂家
     */
    @RequiresPermissions("system:factory:add")
    @Log(title = "生产厂家", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TProductFactory tProductFactory)
    {
        return toAjax(tProductFactoryService.insertTProductFactory(tProductFactory));
    }

    /**
     * 修改生产厂家
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TProductFactory tProductFactory = tProductFactoryService.selectTProductFactoryById(id);
        mmap.put("tProductFactory", tProductFactory);
        return prefix + "/edit";
    }

    /**
     * 修改保存生产厂家
     */
    @RequiresPermissions("system:factory:edit")
    @Log(title = "生产厂家", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TProductFactory tProductFactory)
    {
        return toAjax(tProductFactoryService.updateTProductFactory(tProductFactory));
    }

    /**
     * 删除生产厂家
     */
    @RequiresPermissions("system:factory:remove")
    @Log(title = "生产厂家", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tProductFactoryService.deleteTProductFactoryByIds(ids));
    }



    @RequestMapping("/checknameUnique")
    @ResponseBody
    public String check(String name){
        TProductFactory tProductFactory = new TProductFactory();
        tProductFactory.setName(name);
        return tProductFactoryService.selectTProductFactoryList(tProductFactory).size() > 0 ? "1" : "0";
    }
}
