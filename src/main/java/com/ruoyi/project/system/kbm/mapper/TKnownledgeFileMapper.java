package com.ruoyi.project.system.kbm.mapper;

import com.ruoyi.project.system.kbm.domain.TKnownledgeFile;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-21
 */
public interface TKnownledgeFileMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param fileId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TKnownledgeFile selectTKnownledgeFileById(Long fileId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tKnownledgeFile 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TKnownledgeFile> selectTKnownledgeFileList(TKnownledgeFile tKnownledgeFile);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tKnownledgeFile 【请填写功能名称】
     * @return 结果
     */
    public int insertTKnownledgeFile(TKnownledgeFile tKnownledgeFile);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tKnownledgeFile 【请填写功能名称】
     * @return 结果
     */
    public int updateTKnownledgeFile(TKnownledgeFile tKnownledgeFile);

    /**
     * 删除【请填写功能名称】
     * 
     * @param fileId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTKnownledgeFileById(String fileId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param fileIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteTKnownledgeFileByIds(String[] fileIds);
}
