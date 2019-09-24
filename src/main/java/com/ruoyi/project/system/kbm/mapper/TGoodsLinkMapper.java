package com.ruoyi.project.system.kbm.mapper;

import com.ruoyi.project.system.kbm.domain.TGoodsLink;
import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public interface TGoodsLinkMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param numIid 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TGoodsLink selectTGoodsLinkById(Long numIid);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tGoodsLink 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TGoodsLink> selectTGoodsLinkList(TGoodsLink tGoodsLink);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tGoodsLink 【请填写功能名称】
     * @return 结果
     */
    public int insertTGoodsLink(TGoodsLink tGoodsLink);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tGoodsLink 【请填写功能名称】
     * @return 结果
     */
    public int updateTGoodsLink(TGoodsLink tGoodsLink);

    /**
     * 删除【请填写功能名称】
     * 
     * @param numIid 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTGoodsLinkById(Long numIid);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param numIids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTGoodsLinkByIds(String[] numIids);
}
