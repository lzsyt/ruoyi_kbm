package com.ruoyi.project.system.kbm.service.impl;

import java.util.List;

import com.ruoyi.project.system.kbm.domain.TGoodsLink;
import com.ruoyi.project.system.kbm.mapper.TGoodsLinkMapper;
import com.ruoyi.project.system.kbm.service.ITGoodsLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
@Service
public class TGoodsLinkServiceImpl implements ITGoodsLinkService
{
    @Autowired
    private TGoodsLinkMapper tGoodsLinkMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param numIid 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TGoodsLink selectTGoodsLinkById(Long numIid)
    {
        return tGoodsLinkMapper.selectTGoodsLinkById(numIid);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tGoodsLink 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TGoodsLink> selectTGoodsLinkList(TGoodsLink tGoodsLink)
    {
        return tGoodsLinkMapper.selectTGoodsLinkList(tGoodsLink);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tGoodsLink 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTGoodsLink(TGoodsLink tGoodsLink)
    {
        return tGoodsLinkMapper.insertTGoodsLink(tGoodsLink);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tGoodsLink 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTGoodsLink(TGoodsLink tGoodsLink)
    {
        return tGoodsLinkMapper.updateTGoodsLink(tGoodsLink);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTGoodsLinkByIds(String ids)
    {
        return tGoodsLinkMapper.deleteTGoodsLinkByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param numIid 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTGoodsLinkById(Long numIid)
    {
        return tGoodsLinkMapper.deleteTGoodsLinkById(numIid);
    }
}
