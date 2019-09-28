package com.ruoyi.project.system.kbm.mapper;

import com.ruoyi.project.system.kbm.domain.KnowledgeGoodlinkCatMap;
import java.util.List;

/**
 * mapMapper接口
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public interface KnowledgeGoodlinkCatMapMapper 
{
    /**
     * 查询map
     * 
     * @param knowledgeId mapID
     * @return map
     */
    public List<KnowledgeGoodlinkCatMap> selectKnowledgeGoodlinkCatMapById(String knowledgeId);

    /**
     * 查询map列表
     * 
     * @param knowledgeGoodlinkCatMap map
     * @return map集合
     */
    public List<KnowledgeGoodlinkCatMap> selectKnowledgeGoodlinkCatMapList(KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap);

    /**
     * 新增map
     * 
     * @param knowledgeGoodlinkCatMap map
     * @return 结果
     */
    public int insertKnowledgeGoodlinkCatMap(KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap);

    /**
     * 修改map
     * 
     * @param knowledgeGoodlinkCatMap map
     * @return 结果
     */
    public int updateKnowledgeGoodlinkCatMap(KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap);

    /**
     * 删除map
     * 
     * @param knowledgeId mapID
     * @return 结果
     */
    public int deleteKnowledgeGoodlinkCatMapById(String knowledgeId);

    /**
     * 批量删除map
     * 
     * @param knowledgeIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteKnowledgeGoodlinkCatMapByIds(String[] knowledgeIds);
}
