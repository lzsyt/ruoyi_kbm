package com.ruoyi.project.system.kbm.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.kbm.domain.KnowledgeGoodlinkCatMap;
import com.ruoyi.project.system.kbm.domain.TKeyword;
import com.ruoyi.project.system.kbm.domain.TKnowledge;
import com.ruoyi.project.system.kbm.domain.TKnownledgeFile;
import com.ruoyi.project.system.kbm.mapper.*;
import com.ruoyi.project.system.kbm.service.ITKnowledgeService;
import net.bytebuddy.asm.Advice;
import net.sf.jsqlparser.statement.select.First;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 知识库Service业务层处理
 *
 * @author ruoyi
 * @date 2019-09-19
 */
@Service
public class TKnowledgeServiceImpl implements ITKnowledgeService {
    @Resource
    private TKnowledgeMapper tKnowledgeMapper;
    @Resource
    private TKnownledgeFileMapper tKnownledgeFileMapper;
    @Resource
    private TProductFactoryMapper tProductFactoryMapper;


    private String getFactoryName(String factoryId){
        if (StringUtils.isNotEmpty(factoryId)) {
            return tProductFactoryMapper.selectTProductFactoryById(Long.valueOf(factoryId)).getName();
        }
        return null;
    }


    @Resource
    private KnowledgeGoodlinkCatMapMapper knowledgeGoodlinkCatMapMapper;

    private static final String[] VDOTYPE = {"mp4", "avi"};
    private static final String[] DOCTYPE = {"doc", "docx", "ppt", "xl", "xls", "txt", "xlsx", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "html", "htm", "txt", "pdf"};
    private static final String[] IMATYPE = {"jpg", "png", "gif", "bmp", "gif", "jpg", "jpeg", "png",};

    //判断是否为图片
    private boolean isImg(String suffix) {
        boolean flag = false;
        for (int i = 0; i < IMATYPE.length; i++) {
            if (IMATYPE[i].equalsIgnoreCase(suffix)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    //判断是否为文档
    private boolean isDoc(String suffix) {
        boolean flag = false;
        for (int i = 0; i < DOCTYPE.length; i++) {
            if (DOCTYPE[i].equalsIgnoreCase(suffix)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    //判断是否为视频
    private boolean isVdo(String suffix) {
        boolean flag = false;
        for (int i = 0; i < VDOTYPE.length; i++) {
            if (VDOTYPE[i].equalsIgnoreCase(suffix)) {
                flag = true;
                break;
            }
        }
        return flag;
    }


    private Map<String, String> insertKFile(MultipartFile[] file, String id) throws IOException {
        Map<String, String> filePathMap = new HashMap<>();
        if (file == null || file.length == 0) {
            return filePathMap;
        }
        //遍历文件
        for (int i = 0; i < file.length; i++) {
            //获取文件类型
            String suffix = file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf(".") + 1);

            if (isImg(suffix)) {                 //判断是否为图片
                setImgPath(file[i],id);
            } else if (isDoc(suffix)) {           //判断是否为文档
                setDocPath(file[i],id);
            } else if (isVdo(suffix)) {           //判断是否为视频
                setVdoPath(file[i],id);
            } else {
                System.out.println("文件格式不符合要求");
            }
        }
        return filePathMap;
    }

    private void setDocPath(MultipartFile file,String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = FileUploadUtils.upload(FileUploadUtils.getDefaultBaseDir()+"/doc",file);
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setFileName(fileName);
        tKnownledgeFile.setFilePath(filePath);
        tKnownledgeFile.setKnowledgeId(id);
        tKnownledgeFile.setFileType(3L);
        tKnownledgeFileMapper.insertTKnownledgeFile(tKnownledgeFile);
    }

    private void setVdoPath(MultipartFile file,String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = FileUploadUtils.upload(FileUploadUtils.getDefaultBaseDir()+"/vdo",file);
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setFileName(fileName);
        tKnownledgeFile.setFilePath(filePath);
        tKnownledgeFile.setKnowledgeId(id);
        tKnownledgeFile.setFileType(2L);
        tKnownledgeFileMapper.insertTKnownledgeFile(tKnownledgeFile);
    }

    private void setImgPath(MultipartFile file,String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = FileUploadUtils.upload(FileUploadUtils.getDefaultBaseDir()+"/images",file);
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setFileName(fileName);
        tKnownledgeFile.setFilePath(filePath);
        tKnownledgeFile.setKnowledgeId(id);
        tKnownledgeFile.setFileType(1L);
        tKnownledgeFileMapper.insertTKnownledgeFile(tKnownledgeFile);
    }

    private void setFilePath(String id, MultipartFile[] file) {
        try {
            insertKFile(file, id);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 查询知识库
     *
     * @param id 知识库ID
     * @return 知识库
     */
    @Override
    public TKnowledge selectTKnowledgeById(String id) {
        TKnowledge knowledge = tKnowledgeMapper.selectTKnowledgeById(id);
        knowledge.setFactoryName(getFactoryName(knowledge.getProductFactory()));
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setKnowledgeId(id);
        knowledge.setFiles(tKnownledgeFileMapper.selectTKnownledgeFileList(tKnownledgeFile));
        KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap = knowledgeGoodlinkCatMapMapper.selectKnowledgeGoodlinkCatMapById(knowledge.getId());
        if (knowledgeGoodlinkCatMap!=null&&knowledgeGoodlinkCatMap.getKnowledgeId()!=null){
            knowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMap);
        }
        return knowledge;
    }

    /**
     * 查询知识库列表
     *
     * @param tKnowledge 知识库
     * @return 知识库
     */
    @Override
    public List<TKnowledge> selectTKnowledgeList(TKnowledge tKnowledge) {
        List<TKnowledge> knowledgeList = tKnowledgeMapper.selectTKnowledgeList(tKnowledge);

        for (TKnowledge knowledge : knowledgeList) {
            knowledge.setFactoryName(getFactoryName(knowledge.getProductFactory()));
            TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
            tKnownledgeFile.setKnowledgeId(knowledge.getId());
            knowledge.setFiles(tKnownledgeFileMapper.selectTKnownledgeFileList(tKnownledgeFile));
        }
        for (TKnowledge knowledge:knowledgeList) {
            if (knowledge.getFiles() != null && knowledge.getFiles().size() != 0) {
                for (TKnownledgeFile file : knowledge.getFiles()) {
                    if (file.getFileType() == 1L) {
                        knowledge.setImagePath(file.getFilePath());
                        break;
                    }
                }
            }

        }
        return knowledgeList;
    }

    /**
     * 新增知识库
     *
     * @param tKnowledge 知识库
     * @param file       文件上传
     * @return 结果
     */
    @Override
    public int insertTKnowledge(TKnowledge tKnowledge, MultipartFile[] file) {
        tKnowledge.setId(String.valueOf(System.currentTimeMillis()));
        tKnowledge.setBuildTime(new Date());
        setFilePath(tKnowledge.getId(), file);
        int result = tKnowledgeMapper.insertTKnowledge(tKnowledge);
        if (tKnowledge.getKnowledgeGoodlinkCatMap()!=null){
            tKnowledge.getKnowledgeGoodlinkCatMap().setKnowledgeId(tKnowledge.getId());
            knowledgeGoodlinkCatMapMapper.insertKnowledgeGoodlinkCatMap(tKnowledge.getKnowledgeGoodlinkCatMap());
        }
        return result;
    }

    /**
     * 修改知识库
     *
     * @param tKnowledge 知识库
     * @param file       文件上传
     * @return 结果
     */
    @Override
    public int updateTKnowledge(TKnowledge tKnowledge, MultipartFile[] file) {
        setFilePath(tKnowledge.getId(), file);
        if (StringUtils.isEmpty(tKnowledge.getSort())){
            tKnowledge.setSort(null);
        }
        if (tKnowledge.getKnowledgeGoodlinkCatMap()!=null){
            tKnowledge.getKnowledgeGoodlinkCatMap().setKnowledgeId(tKnowledge.getId());
            KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap = knowledgeGoodlinkCatMapMapper.selectKnowledgeGoodlinkCatMapById(tKnowledge.getId());
            if (knowledgeGoodlinkCatMap!=null){
                knowledgeGoodlinkCatMapMapper.updateKnowledgeGoodlinkCatMap(tKnowledge.getKnowledgeGoodlinkCatMap());
            }else{
                knowledgeGoodlinkCatMapMapper.insertKnowledgeGoodlinkCatMap(tKnowledge.getKnowledgeGoodlinkCatMap());
            }
        }
        return tKnowledgeMapper.updateTKnowledge(tKnowledge);
    }


    /**
     * 删除知识库对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTKnowledgeByIds(String ids) {
        return tKnowledgeMapper.deleteTKnowledgeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除知识库信息
     *
     * @param id 知识库ID
     * @return 结果
     */
    public int deleteTKnowledgeById(String id) {
        return tKnowledgeMapper.deleteTKnowledgeById(id);
    }

    /**
     * 查询最近添加的一条
     *
     * @return TKnowledge
     */
    @Override
    public TKnowledge selectTKnowledgeRecent() {
        TKnowledge tKnowledge = tKnowledgeMapper.selecttknowledgeRecent();
        tKnowledge.setFactoryName(getFactoryName(tKnowledge.getProductFactory()));
        KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap = knowledgeGoodlinkCatMapMapper.selectKnowledgeGoodlinkCatMapById(tKnowledge.getId());
        tKnowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMap);
        return tKnowledge;
    }
}
