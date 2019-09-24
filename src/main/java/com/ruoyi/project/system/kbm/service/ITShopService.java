package com.ruoyi.project.system.kbm.service;

import com.ruoyi.project.system.kbm.domain.TShop;
import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public interface ITShopService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TShop selectTShopById(Integer id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tShop 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TShop> selectTShopList(TShop tShop);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tShop 【请填写功能名称】
     * @return 结果
     */
    public int insertTShop(TShop tShop);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tShop 【请填写功能名称】
     * @return 结果
     */
    public int updateTShop(TShop tShop);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTShopByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTShopById(Integer id);
}
