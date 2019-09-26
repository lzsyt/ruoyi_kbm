package com.ruoyi.project.system.kbm.mapper;

import com.ruoyi.project.system.kbm.domain.TKeyword;
import java.util.List;

/**
 * 关键字Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
public interface TKeywordMapper 
{
    /**
     * 查询关键字
     * 
     * @param id 关键字ID
     * @return 关键字
     */
    public TKeyword selectTKeywordById(Long id);

    /**
     * 查询关键字列表
     * 
     * @param tKeyword 关键字
     * @return 关键字集合
     */
    public List<TKeyword> selectTKeywordList(TKeyword tKeyword);

    /**
     * 新增关键字
     * 
     * @param tKeyword 关键字
     * @return 结果
     */
    public int insertTKeyword(TKeyword tKeyword);

    /**
     * 修改关键字
     * 
     * @param tKeyword 关键字
     * @return 结果
     */
    public int updateTKeyword(TKeyword tKeyword);

    /**
     * 删除关键字
     * 
     * @param id 关键字ID
     * @return 结果
     */
    public int deleteTKeywordById(Long id);

    /**
     * 批量删除关键字
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTKeywordByIds(String[] ids);
}
