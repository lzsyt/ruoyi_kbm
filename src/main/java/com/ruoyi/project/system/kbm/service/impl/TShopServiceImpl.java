package com.ruoyi.project.system.kbm.service.impl;

import java.util.List;

import com.ruoyi.project.system.kbm.domain.TShop;
import com.ruoyi.project.system.kbm.mapper.TShopMapper;
import com.ruoyi.project.system.kbm.service.ITShopService;
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
public class TShopServiceImpl implements ITShopService
{
    @Autowired
    private TShopMapper tShopMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TShop selectTShopById(Integer id)
    {
        return tShopMapper.selectTShopById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tShop 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TShop> selectTShopList(TShop tShop)
    {
        return tShopMapper.selectTShopList(tShop);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tShop 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTShop(TShop tShop)
    {
        return tShopMapper.insertTShop(tShop);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tShop 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTShop(TShop tShop)
    {
        return tShopMapper.updateTShop(tShop);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTShopByIds(String ids)
    {
        return tShopMapper.deleteTShopByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTShopById(Integer id)
    {
        return tShopMapper.deleteTShopById(id);
    }
}
