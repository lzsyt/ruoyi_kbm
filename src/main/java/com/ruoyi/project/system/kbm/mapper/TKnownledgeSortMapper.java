package com.ruoyi.project.system.kbm.mapper;

import com.ruoyi.project.system.kbm.domain.TKnownledgeSort;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-19
 */
public interface TKnownledgeSortMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TKnownledgeSort selectTKnownledgeSortById(Integer id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tKnownledgeSort 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TKnownledgeSort> selectTKnownledgeSortList(TKnownledgeSort tKnownledgeSort);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tKnownledgeSort 【请填写功能名称】
     * @return 结果
     */
    public int insertTKnownledgeSort(TKnownledgeSort tKnownledgeSort);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tKnownledgeSort 【请填写功能名称】
     * @return 结果
     */
    public int updateTKnownledgeSort(TKnownledgeSort tKnownledgeSort);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTKnownledgeSortById(Integer id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTKnownledgeSortByIds(String[] ids);
}
