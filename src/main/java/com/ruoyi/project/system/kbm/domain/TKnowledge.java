package com.ruoyi.project.system.kbm.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;
import java.util.List;

/**
 * 【请填写功能名称】对象 t_knowledge
 * 
 * @author ruoyi
 * @date 2019-09-19
 */
public class TKnowledge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String ask;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String answer;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String dataOrg;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String imagePath;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String shopNum;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String productName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String videoPath;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String docPath;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date buildTime;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String productFactory;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String sort;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long groupId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date created;

    private String keyword;

    private List<String> sorts;

    private List<TKnownledgeFile> files;

    private String sortName;
    private String orgName;

    private String factoryName;

    public String getFactoryName() {
        return factoryName;
    }

    private String shopName;

    private String shop_id;

    public String getShop_id() {
        return shop_id;
    }

    public void setShop_id(String shop_id) {
        this.shop_id = shop_id;
    }

    private String goodlinkName;

    public String getGoodlinkName() {
        return goodlinkName;
    }

    public void setGoodlinkName(String goodlinkName) {
        this.goodlinkName = goodlinkName;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public List<KnowledgeGoodlinkCatMap> getKnowledgeGoodlinkCatMapList() {
        return knowledgeGoodlinkCatMapList;
    }

    public void setKnowledgeGoodlinkCatMapList(List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList) {
        this.knowledgeGoodlinkCatMapList = knowledgeGoodlinkCatMapList;
    }

    public void setFactoryName(String factoryName) {
        this.factoryName = factoryName;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    private List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList;


    public List<KnowledgeGoodlinkCatMap> getKnowledgeGoodlinkCatMap() {
        return knowledgeGoodlinkCatMapList;
    }

    public void setKnowledgeGoodlinkCatMap(List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList) {
        this.knowledgeGoodlinkCatMapList = knowledgeGoodlinkCatMapList;
    }

    public List<TKnownledgeFile> getFiles() {
        return files;
    }

    public void setFiles(List<TKnownledgeFile> files) {
        this.files = files;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }


    public List<String> getSorts() {
        return sorts;
    }

    public void setSorts(List<String> sorts) {
        this.sorts = sorts;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setAsk(String ask) 
    {
        this.ask = ask;
    }

    public String getAsk() 
    {
        return ask;
    }
    public void setAnswer(String answer) 
    {
        this.answer = answer;
    }

    public String getAnswer() 
    {
        return answer;
    }
    public void setDataOrg(String dataOrg) 
    {
        this.dataOrg = dataOrg;
    }

    public String getDataOrg() 
    {
        return dataOrg;
    }
    public void setImagePath(String imagePath) 
    {
        this.imagePath = imagePath;
    }

    public String getImagePath() 
    {
        return imagePath;
    }
    public void setShopNum(String shopNum) 
    {
        this.shopNum = shopNum;
    }

    public String getShopNum() 
    {
        return shopNum;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setVideoPath(String videoPath) 
    {
        this.videoPath = videoPath;
    }

    public String getVideoPath() 
    {
        return videoPath;
    }
    public void setDocPath(String docPath) 
    {
        this.docPath = docPath;
    }

    public String getDocPath() 
    {
        return docPath;
    }
    public void setBuildTime(Date buildTime) 
    {
        this.buildTime = buildTime;
    }

    public Date getBuildTime() 
    {
        return buildTime;
    }
    public void setProductFactory(String productFactory) 
    {
        this.productFactory = productFactory;
    }

    public String getProductFactory() 
    {
        return productFactory;
    }
    public void setSort(String sort)
    {
        this.sort = sort;
    }

    public String getSort()
    {
        return sort;
    }
    public void setGroupId(Long groupId) 
    {
        this.groupId = groupId;
    }

    public Long getGroupId() 
    {
        return groupId;
    }
    public void setCreated(Date created) 
    {
        this.created = created;
    }

    public Date getCreated() 
    {
        return created;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("ask", getAsk())
            .append("answer", getAnswer())
            .append("dataOrg", getDataOrg())
            .append("imagePath", getImagePath())
            .append("shopNum", getShopNum())
            .append("productName", getProductName())
            .append("videoPath", getVideoPath())
            .append("docPath", getDocPath())
            .append("buildTime", getBuildTime())
            .append("productFactory", getProductFactory())
            .append("sort", getSort())
            .append("groupId", getGroupId())
            .append("created", getCreated())
            .toString();
    }
}
