package com.ruoyi.project.system.kbm.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.kbm.mapper.TProductFactoryMapper;
import com.ruoyi.project.system.kbm.domain.TProductFactory;
import com.ruoyi.project.system.kbm.service.ITProductFactoryService;
import com.ruoyi.common.utils.text.Convert;

import javax.annotation.Resource;

/**
 * 生产厂家Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-28
 */
@Service
public class TProductFactoryServiceImpl implements ITProductFactoryService 
{
    @Resource
    private TProductFactoryMapper tProductFactoryMapper;

    /**
     * 查询生产厂家
     * 
     * @param id 生产厂家ID
     * @return 生产厂家
     */
    @Override
    public TProductFactory selectTProductFactoryById(Long id)
    {
        return tProductFactoryMapper.selectTProductFactoryById(id);
    }

    /**
     * 查询生产厂家列表
     * 
     * @param tProductFactory 生产厂家
     * @return 生产厂家
     */
    @Override
    public List<TProductFactory> selectTProductFactoryList(TProductFactory tProductFactory)
    {
        return tProductFactoryMapper.selectTProductFactoryList(tProductFactory);
    }

    /**
     * 新增生产厂家
     * 
     * @param tProductFactory 生产厂家
     * @return 结果
     */
    @Override
    public int insertTProductFactory(TProductFactory tProductFactory)
    {
        return tProductFactoryMapper.insertTProductFactory(tProductFactory);
    }

    /**
     * 修改生产厂家
     * 
     * @param tProductFactory 生产厂家
     * @return 结果
     */
    @Override
    public int updateTProductFactory(TProductFactory tProductFactory)
    {
        return tProductFactoryMapper.updateTProductFactory(tProductFactory);
    }

    /**
     * 删除生产厂家对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTProductFactoryByIds(String ids)
    {
        return tProductFactoryMapper.deleteTProductFactoryByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除生产厂家信息
     * 
     * @param id 生产厂家ID
     * @return 结果
     */
    public int deleteTProductFactoryById(Long id)
    {
        return tProductFactoryMapper.deleteTProductFactoryById(id);
    }
}
