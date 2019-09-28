package com.ruoyi.project.system.kbm.service;

import com.ruoyi.project.system.kbm.domain.TProductFactory;
import java.util.List;

/**
 * 生产厂家Service接口
 * 
 * @author ruoyi
 * @date 2019-09-28
 */
public interface ITProductFactoryService 
{
    /**
     * 查询生产厂家
     * 
     * @param id 生产厂家ID
     * @return 生产厂家
     */
    public TProductFactory selectTProductFactoryById(Long id);

    /**
     * 查询生产厂家列表
     * 
     * @param tProductFactory 生产厂家
     * @return 生产厂家集合
     */
    public List<TProductFactory> selectTProductFactoryList(TProductFactory tProductFactory);

    /**
     * 新增生产厂家
     * 
     * @param tProductFactory 生产厂家
     * @return 结果
     */
    public int insertTProductFactory(TProductFactory tProductFactory);

    /**
     * 修改生产厂家
     * 
     * @param tProductFactory 生产厂家
     * @return 结果
     */
    public int updateTProductFactory(TProductFactory tProductFactory);

    /**
     * 批量删除生产厂家
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTProductFactoryByIds(String ids);

    /**
     * 删除生产厂家信息
     * 
     * @param id 生产厂家ID
     * @return 结果
     */
    public int deleteTProductFactoryById(Long id);
}
