package com.ruoyi.project.system.kbm.controller;

import java.util.List;

import com.ruoyi.project.system.kbm.domain.TGoodsLink;
import com.ruoyi.project.system.kbm.service.ITGoodsLinkService;
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
@RequestMapping("/system/link")
public class TGoodsLinkController extends BaseController
{
    private String prefix = "system/link";

    @Autowired
    private ITGoodsLinkService tGoodsLinkService;

    @RequiresPermissions("system:link:view")
    @GetMapping()
    public String link()
    {
        return prefix + "/link";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:link:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TGoodsLink tGoodsLink)
    {
        startPage();
        List<TGoodsLink> list = tGoodsLinkService.selectTGoodsLinkList(tGoodsLink);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:link:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TGoodsLink tGoodsLink)
    {
        List<TGoodsLink> list = tGoodsLinkService.selectTGoodsLinkList(tGoodsLink);
        ExcelUtil<TGoodsLink> util = new ExcelUtil<TGoodsLink>(TGoodsLink.class);
        return util.exportExcel(list, "link");
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
    @RequiresPermissions("system:link:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TGoodsLink tGoodsLink)
    {
        return toAjax(tGoodsLinkService.insertTGoodsLink(tGoodsLink));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{numIid}")
    public String edit(@PathVariable("numIid") Long numIid, ModelMap mmap)
    {
        TGoodsLink tGoodsLink = tGoodsLinkService.selectTGoodsLinkById(numIid);
        mmap.put("tGoodsLink", tGoodsLink);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:link:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TGoodsLink tGoodsLink)
    {
        return toAjax(tGoodsLinkService.updateTGoodsLink(tGoodsLink));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:link:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tGoodsLinkService.deleteTGoodsLinkByIds(ids));
    }
}
