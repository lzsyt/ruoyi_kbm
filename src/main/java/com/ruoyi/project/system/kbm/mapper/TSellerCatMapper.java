package com.ruoyi.project.system.kbm.mapper;

import com.ruoyi.project.system.kbm.domain.TSellerCat;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public interface TSellerCatMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param cid 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TSellerCat selectTSellerCatById(Long cid);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tSellerCat 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TSellerCat> selectTSellerCatList(TSellerCat tSellerCat);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tSellerCat 【请填写功能名称】
     * @return 结果
     */
    public int insertTSellerCat(TSellerCat tSellerCat);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tSellerCat 【请填写功能名称】
     * @return 结果
     */
    public int updateTSellerCat(TSellerCat tSellerCat);

    /**
     * 删除【请填写功能名称】
     * 
     * @param cid 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTSellerCatById(Long cid);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param cids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTSellerCatByIds(String[] cids);
}
