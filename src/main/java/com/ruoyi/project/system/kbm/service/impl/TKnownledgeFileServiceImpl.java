package com.ruoyi.project.system.kbm.service.impl;

import java.util.List;

import com.ruoyi.project.system.kbm.domain.TKnownledgeFile;
import com.ruoyi.project.system.kbm.mapper.TKnownledgeFileMapper;
import com.ruoyi.project.system.kbm.service.ITKnownledgeFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-21
 */
@Service
public class TKnownledgeFileServiceImpl implements ITKnownledgeFileService
{
    @Autowired
    private TKnownledgeFileMapper tKnownledgeFileMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param fileId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TKnownledgeFile selectTKnownledgeFileById(Long fileId)
    {
        return tKnownledgeFileMapper.selectTKnownledgeFileById(fileId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tKnownledgeFile 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TKnownledgeFile> selectTKnownledgeFileList(TKnownledgeFile tKnownledgeFile)
    {
        return tKnownledgeFileMapper.selectTKnownledgeFileList(tKnownledgeFile);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tKnownledgeFile 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTKnownledgeFile(TKnownledgeFile tKnownledgeFile)
    {
        return tKnownledgeFileMapper.insertTKnownledgeFile(tKnownledgeFile);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tKnownledgeFile 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTKnownledgeFile(TKnownledgeFile tKnownledgeFile)
    {
        return tKnownledgeFileMapper.updateTKnownledgeFile(tKnownledgeFile);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTKnownledgeFileByIds(String ids)
    {
        return tKnownledgeFileMapper.deleteTKnownledgeFileByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param fileId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTKnownledgeFileById(String fileId)
    {
        return tKnownledgeFileMapper.deleteTKnownledgeFileById(fileId);
    }
}
