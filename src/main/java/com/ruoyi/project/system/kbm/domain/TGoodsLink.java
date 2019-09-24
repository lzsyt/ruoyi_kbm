package com.ruoyi.project.system.kbm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 t_goods_link
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public class TGoodsLink extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long numIid;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String title;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String detailUrl;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String goodsId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String propertyAlias;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String nick;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer state;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String picPath;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer isSku;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String warehouseId;

    /** 是否删除，默认为0；0：否；1：是； */
    @Excel(name = "是否删除，默认为0；0：否；1：是；")
    private Integer isDel;

    /** 商品分类id */
    @Excel(name = "商品分类id")
    private Long cid;

    /** 是否更新 */
    @Excel(name = "是否更新")
    private Integer isUpdate;

    public void setNumIid(Long numIid) 
    {
        this.numIid = numIid;
    }

    public Long getNumIid() 
    {
        return numIid;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setDetailUrl(String detailUrl) 
    {
        this.detailUrl = detailUrl;
    }

    public String getDetailUrl() 
    {
        return detailUrl;
    }
    public void setGoodsId(String goodsId) 
    {
        this.goodsId = goodsId;
    }

    public String getGoodsId() 
    {
        return goodsId;
    }
    public void setPropertyAlias(String propertyAlias) 
    {
        this.propertyAlias = propertyAlias;
    }

    public String getPropertyAlias() 
    {
        return propertyAlias;
    }
    public void setNick(String nick) 
    {
        this.nick = nick;
    }

    public String getNick() 
    {
        return nick;
    }
    public void setState(Integer state) 
    {
        this.state = state;
    }

    public Integer getState() 
    {
        return state;
    }
    public void setPicPath(String picPath) 
    {
        this.picPath = picPath;
    }

    public String getPicPath() 
    {
        return picPath;
    }
    public void setIsSku(Integer isSku) 
    {
        this.isSku = isSku;
    }

    public Integer getIsSku() 
    {
        return isSku;
    }
    public void setWarehouseId(String warehouseId) 
    {
        this.warehouseId = warehouseId;
    }

    public String getWarehouseId() 
    {
        return warehouseId;
    }
    public void setIsDel(Integer isDel) 
    {
        this.isDel = isDel;
    }

    public Integer getIsDel() 
    {
        return isDel;
    }
    public void setCid(Long cid) 
    {
        this.cid = cid;
    }

    public Long getCid() 
    {
        return cid;
    }
    public void setIsUpdate(Integer isUpdate) 
    {
        this.isUpdate = isUpdate;
    }

    public Integer getIsUpdate() 
    {
        return isUpdate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("numIid", getNumIid())
            .append("title", getTitle())
            .append("detailUrl", getDetailUrl())
            .append("goodsId", getGoodsId())
            .append("propertyAlias", getPropertyAlias())
            .append("nick", getNick())
            .append("state", getState())
            .append("picPath", getPicPath())
            .append("isSku", getIsSku())
            .append("warehouseId", getWarehouseId())
            .append("isDel", getIsDel())
            .append("cid", getCid())
            .append("isUpdate", getIsUpdate())
            .toString();
    }
}
