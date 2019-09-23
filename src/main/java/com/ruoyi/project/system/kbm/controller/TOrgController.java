package com.ruoyi.project.system.kbm.controller;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.kbm.domain.TOrg;
import com.ruoyi.project.system.kbm.service.ITOrgService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2019-09-19
 */
@Controller
@RequestMapping("/system/org")
public class TOrgController extends BaseController
{
    private String prefix = "system/org";

    @Autowired
    private ITOrgService tOrgService;




    @RequestMapping("get")
    @ResponseBody
    public List<TOrg> getOrg(){
        List<TOrg> dborg = tOrgService.selectTOrgList(null);
        List<TOrg> orgs =tOrgService.getChild(dborg);
        for (TOrg org : orgs) {
            for (TOrg tOrg : dborg) {
                if (StringUtils.isNotEmpty(tOrg.getParentId())&& org.getId().equals(tOrg.getParentId())){
                    return null;
                }
            }
        }
        return orgs;
    }

    @RequiresPermissions("system:org:view")
    @GetMapping()
    public String org()
    {
        return prefix + "/org";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:org:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TOrg tOrg)
    {
        startPage();
        List<TOrg> list = tOrgService.selectTOrgList(tOrg);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:org:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TOrg tOrg)
    {
        List<TOrg> list = tOrgService.selectTOrgList(tOrg);
        ExcelUtil<TOrg> util = new ExcelUtil<TOrg>(TOrg.class);
        return util.exportExcel(list, "org");
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
    @RequiresPermissions("system:org:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TOrg tOrg)
    {
        return toAjax(tOrgService.insertTOrg(tOrg));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        TOrg tOrg = tOrgService.selectTOrgById(id);
        mmap.put("tOrg", tOrg);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:org:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TOrg tOrg)
    {
        return toAjax(tOrgService.updateTOrg(tOrg));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:org:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tOrgService.deleteTOrgByIds(ids));
    }
}
