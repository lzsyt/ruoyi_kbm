package com.ruoyi.project.system.kbm.controller;

import java.util.List;

import com.ruoyi.project.system.kbm.domain.TShop;
import com.ruoyi.project.system.kbm.service.ITShopService;
import org.apache.poi.ss.formula.functions.T;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/system/shop")
public class TShopController extends BaseController
{
    private String prefix = "system/shop";


    @Autowired
    private ITShopService tShopService;


    @RequiresPermissions("system:shop:view")
    @GetMapping()
    public String shop()
    {
        return prefix + "/shop";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:shop:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TShop tShop)
    {
        startPage();
        List<TShop> list = tShopService.selectTShopList(tShop);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:shop:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TShop tShop)
    {
        List<TShop> list = tShopService.selectTShopList(tShop);
        ExcelUtil<TShop> util = new ExcelUtil<TShop>(TShop.class);
        return util.exportExcel(list, "shop");
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
    @RequiresPermissions("system:shop:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TShop tShop)
    {
        return toAjax(tShopService.insertTShop(tShop));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        TShop tShop = tShopService.selectTShopById(id);
        mmap.put("tShop", tShop);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:shop:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TShop tShop)
    {
        return toAjax(tShopService.updateTShop(tShop));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:shop:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tShopService.deleteTShopByIds(ids));
    }
}
