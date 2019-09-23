package com.ruoyi.project.system.kbm.service.impl;

import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.kbm.domain.TKnownledgeSort;
import com.ruoyi.project.system.kbm.mapper.TKnownledgeSortMapper;
import com.ruoyi.project.system.kbm.service.ITKnownledgeSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 知识库Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-19
 */
@Service
public class TKnownledgeSortServiceImpl implements ITKnownledgeSortService
{
    @Autowired
    private TKnownledgeSortMapper tKnownledgeSortMapper;

    /**
     * 查询知识库
     * 
     * @param id 知识库ID
     * @return 知识库
     */
    @Override
    public TKnownledgeSort selectTKnownledgeSortById(Integer id)
    {
        return tKnownledgeSortMapper.selectTKnownledgeSortById(id);
    }

    /**
     * 查询知识库列表
     * 
     * @param tKnownledgeSort 知识库
     * @return 知识库
     */
    @Override
    public List<TKnownledgeSort> selectTKnownledgeSortList(TKnownledgeSort tKnownledgeSort)
    {
        return tKnownledgeSortMapper.selectTKnownledgeSortList(tKnownledgeSort);
    }

    /**
     * 新增知识库
     * 
     * @param tKnownledgeSort 知识库
     * @return 结果
     */
    @Override
    public int insertTKnownledgeSort(TKnownledgeSort tKnownledgeSort)
    {
        return tKnownledgeSortMapper.insertTKnownledgeSort(tKnownledgeSort);
    }

    /**
     * 修改知识库
     * 
     * @param tKnownledgeSort 知识库
     * @return 结果
     */
    @Override
    public int updateTKnownledgeSort(TKnownledgeSort tKnownledgeSort)
    {
        return tKnownledgeSortMapper.updateTKnownledgeSort(tKnownledgeSort);
    }

    /**
     * 删除知识库对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTKnownledgeSortByIds(String ids)
    {
        return tKnownledgeSortMapper.deleteTKnownledgeSortByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除知识库信息
     * 
     * @param id 知识库ID
     * @return 结果
     */
    public int deleteTKnownledgeSortById(Integer id)
    {
        return tKnownledgeSortMapper.deleteTKnownledgeSortById(id);
    }
}
