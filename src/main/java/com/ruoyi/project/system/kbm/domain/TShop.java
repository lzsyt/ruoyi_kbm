package com.ruoyi.project.system.kbm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 t_shop
 * 
 * @author ruoyi
 * @date 2019-09-23
 */
public class TShop extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Integer id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String shopName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String shopToken;

    /** 电话 */
    @Excel(name = "电话")
    private String shopTel;

    /** 地址 */
    @Excel(name = "地址")
    private String shopAdds;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setShopName(String shopName) 
    {
        this.shopName = shopName;
    }

    public String getShopName() 
    {
        return shopName;
    }
    public void setShopToken(String shopToken) 
    {
        this.shopToken = shopToken;
    }

    public String getShopToken() 
    {
        return shopToken;
    }
    public void setShopTel(String shopTel) 
    {
        this.shopTel = shopTel;
    }

    public String getShopTel() 
    {
        return shopTel;
    }
    public void setShopAdds(String shopAdds) 
    {
        this.shopAdds = shopAdds;
    }

    public String getShopAdds() 
    {
        return shopAdds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("shopName", getShopName())
            .append("shopToken", getShopToken())
            .append("shopTel", getShopTel())
            .append("shopAdds", getShopAdds())
            .toString();
    }
}
