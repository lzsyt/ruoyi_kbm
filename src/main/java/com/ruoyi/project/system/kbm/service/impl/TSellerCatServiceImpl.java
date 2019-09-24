package com.ruoyi.project.system.kbm.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.web.domain.Ztree;
import com.ruoyi.project.system.dept.domain.Dept;
import com.ruoyi.project.system.kbm.domain.TSellerCat;
import com.ruoyi.project.system.kbm.mapper.TSellerCatMapper;
import com.ruoyi.project.system.kbm.service.ITSellerCatService;
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
public class TSellerCatServiceImpl implements ITSellerCatService {
    @Autowired
    private TSellerCatMapper tSellerCatMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param cid 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TSellerCat selectTSellerCatById(Long cid) {
        return tSellerCatMapper.selectTSellerCatById(cid);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param tSellerCat 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TSellerCat> selectTSellerCatList(TSellerCat tSellerCat) {
        return tSellerCatMapper.selectTSellerCatList(tSellerCat);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param tSellerCat 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTSellerCat(TSellerCat tSellerCat) {
        return tSellerCatMapper.insertTSellerCat(tSellerCat);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param tSellerCat 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTSellerCat(TSellerCat tSellerCat) {
        return tSellerCatMapper.updateTSellerCat(tSellerCat);
    }

    /**
     * 删除【请填写功能名称】对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTSellerCatByIds(String ids) {
        return tSellerCatMapper.deleteTSellerCatByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param cid 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTSellerCatById(Long cid) {
        return tSellerCatMapper.deleteTSellerCatById(cid);
    }

    @Override
    public List<Ztree> getTree(String shopId) {
        TSellerCat tSellerCat = new TSellerCat();
        tSellerCat.setShopId(Integer.valueOf(shopId));
        List<TSellerCat> tSellerCatList = tSellerCatMapper.selectTSellerCatList(tSellerCat);
        List<Ztree> ztreeList = initZtree(tSellerCatList);
        return ztreeList;
    }

    private List<Ztree> initZtree(List<TSellerCat> tSellerCatList) {
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (TSellerCat tSellerCat : tSellerCatList) {
            Ztree ztree = new Ztree();
            ztree.setId(tSellerCat.getCid());
            ztree.setpId(tSellerCat.getParentCid());
            ztree.setName(tSellerCat.getName());
            ztree.setTitle(tSellerCat.getName());
            ztrees.add(ztree);
        }
        return ztrees;
    }
}
