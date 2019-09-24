package com.ruoyi.project.system.kbm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * map对象 knowledge_goodlink_cat_map
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public class KnowledgeGoodlinkCatMap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 知识库 */
    @Excel(name = "知识库")
    private String knowledgeId;

    /** 商品链接id */
    @Excel(name = "商品链接id")
    private Long goodslinkId;

    /** 商品分类id */
    @Excel(name = "商品分类id")
    private Long catId;

    /** 店铺 */
    @Excel(name = "null")
    private Integer shopId;


    private String goodlinkName;
    private String catName;
    private String shopName;

    public String getGoodlinkName() {
        return goodlinkName;
    }

    public void setGoodlinkName(String goodlinkName) {
        this.goodlinkName = goodlinkName;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public void setKnowledgeId(String knowledgeId)
    {
        this.knowledgeId = knowledgeId;
    }

    public String getKnowledgeId() 
    {
        return knowledgeId;
    }
    public void setGoodslinkId(Long goodslinkId) 
    {
        this.goodslinkId = goodslinkId;
    }

    public Long getGoodslinkId() 
    {
        return goodslinkId;
    }
    public void setCatId(Long catId) 
    {
        this.catId = catId;
    }

    public Long getCatId() 
    {
        return catId;
    }
    public void setShopId(Integer shopId) 
    {
        this.shopId = shopId;
    }

    public Integer getShopId() 
    {
        return shopId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("knowledgeId", getKnowledgeId())
            .append("goodslinkId", getGoodslinkId())
            .append("catId", getCatId())
            .append("shopId", getShopId())
            .toString();
    }
}
