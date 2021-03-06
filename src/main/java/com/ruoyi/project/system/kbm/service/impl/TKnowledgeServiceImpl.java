package com.ruoyi.project.system.kbm.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.kbm.domain.*;
import com.ruoyi.project.system.kbm.mapper.*;
import com.ruoyi.project.system.kbm.service.ITKnowledgeService;
import net.bytebuddy.asm.Advice;
import net.sf.jsqlparser.statement.select.First;
import org.apache.poi.ss.formula.functions.T;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.*;

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


    private String getFactoryName(String factoryId) {
        if (StringUtils.isNotEmpty(factoryId)) {

              TProductFactory factory= tProductFactoryMapper.selectTProductFactoryById(Long.valueOf(factoryId));
              if (factory!=null){

                  return tProductFactoryMapper.selectTProductFactoryById(Long.valueOf(factoryId)).getName();

              }


        }
        return null;
    }


    @Resource
    private KnowledgeGoodlinkCatMapMapper knowledgeGoodlinkCatMapMapper;

    private static final String[] VDOTYPE = {"mp4", "avi"};
    private static final String[] DOCTYPE = {"doc", "docx", "ppt", "txt", "xlsx", "docx", "xls", "ppt", "pptx", "pdf"};
    private static final String[] IMATYPE = {"jpg", "png", "bmp", "gif", "jpeg"};

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
                setImgPath(file[i], id);
            } else if (isDoc(suffix)) {           //判断是否为文档
                setDocPath(file[i], id);
            } else if (isVdo(suffix)) {           //判断是否为视频
                setVdoPath(file[i], id);
            } else {
                System.out.println("文件格式不符合要求");
            }
        }
        return filePathMap;
    }

    private void setDocPath(MultipartFile file, String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = FileUploadUtils.upload(FileUploadUtils.getDefaultBaseDir() + "/doc", file);
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setFileName(fileName);
        tKnownledgeFile.setFilePath(filePath);
        tKnownledgeFile.setKnowledgeId(id);
        tKnownledgeFile.setFileType(3L);
        tKnownledgeFileMapper.insertTKnownledgeFile(tKnownledgeFile);
    }

    private void setVdoPath(MultipartFile file, String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = FileUploadUtils.upload(FileUploadUtils.getDefaultBaseDir() + "/vdo", file);
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setFileName(fileName);
        tKnownledgeFile.setFilePath(filePath);
        tKnownledgeFile.setKnowledgeId(id);
        tKnownledgeFile.setFileType(2L);
        tKnownledgeFileMapper.insertTKnownledgeFile(tKnownledgeFile);
    }

    private void setImgPath(MultipartFile file, String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = FileUploadUtils.upload(FileUploadUtils.getDefaultBaseDir() + "/images", file);
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
        if(StringUtils.isNotEmpty(knowledge.getProductFactory())){
            String name=getFactoryName(knowledge.getProductFactory());
            if (StringUtils.isNotEmpty(name)){
                System.out.println("getProductFactory:"+knowledge.getProductFactory());

                knowledge.setFactoryName(name);
            }


        }
        TKnownledgeFile tKnownledgeFile = new TKnownledgeFile();
        tKnownledgeFile.setKnowledgeId(id);
        knowledge.setFiles(tKnownledgeFileMapper.selectTKnownledgeFileList(tKnownledgeFile));
        List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList = knowledgeGoodlinkCatMapMapper.selectKnowledgeGoodlinkCatMapById(knowledge.getId());
        if (knowledgeGoodlinkCatMapList != null && knowledgeGoodlinkCatMapList.size() != 0) {
            knowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMapList);
            knowledge.setShopName(knowledgeGoodlinkCatMapList.get(0).getShopName());
            knowledge.setShop_id(String.valueOf(knowledgeGoodlinkCatMapList.get(0).getShopId()));
            StringBuffer factorys = new StringBuffer();
            for (KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap : knowledgeGoodlinkCatMapList) {
                factorys.append(knowledgeGoodlinkCatMap.getGoodslinkId()).append(",");
            }
            knowledge.setGoodlinkName(factorys.toString());
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
        for (TKnowledge knowledge : knowledgeList) {
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
        if (tKnowledge.getKnowledgeGoodlinkCatMap() != null && tKnowledge.getKnowledgeGoodlinkCatMap().size() != 0) {
            for (KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap : tKnowledge.getKnowledgeGoodlinkCatMap()) {
                knowledgeGoodlinkCatMap.setKnowledgeId(tKnowledge.getId());
                knowledgeGoodlinkCatMapMapper.insertKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMap);
            }
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
        if (StringUtils.isEmpty(tKnowledge.getSort())) {
            tKnowledge.setSort(null);
        }
        if (tKnowledge.getKnowledgeGoodlinkCatMap() != null && tKnowledge.getKnowledgeGoodlinkCatMap().size() != 0) {
            List<String> list = new ArrayList<>();
            for (KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap : tKnowledge.getKnowledgeGoodlinkCatMap()) {
                list.add(knowledgeGoodlinkCatMap.getKnowledgeId());
            }


            for (KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap : tKnowledge.getKnowledgeGoodlinkCatMap()) {
                knowledgeGoodlinkCatMap.setKnowledgeId(tKnowledge.getId());
                List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList = knowledgeGoodlinkCatMapMapper.selectKnowledgeGoodlinkCatMapById(tKnowledge.getId());
                boolean flag = false;
                for (KnowledgeGoodlinkCatMap goodlinkCatMap : knowledgeGoodlinkCatMapList) {
                    if (String.valueOf(goodlinkCatMap.getGoodslinkId()).equals(String.valueOf(knowledgeGoodlinkCatMap.getGoodslinkId()))) {
                       if (String.valueOf(goodlinkCatMap.getShopId()).equals(String.valueOf(knowledgeGoodlinkCatMap.getShopId()))){
                           flag = true;
                           list.remove(goodlinkCatMap.getKnowledgeId());
                           break;
                       }
                    }
                }
                if (flag == false) {
                    //如果没有就插入
                    knowledgeGoodlinkCatMapMapper.insertKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMap);
                }
            }
            for (String s : list) {
                knowledgeGoodlinkCatMapMapper.deleteKnowledgeGoodlinkCatMapById(s);
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
        List<KnowledgeGoodlinkCatMap> knowledgeGoodlinkCatMapList = knowledgeGoodlinkCatMapMapper.selectKnowledgeGoodlinkCatMapById(tKnowledge.getId());
        if (knowledgeGoodlinkCatMapList != null && knowledgeGoodlinkCatMapList.size() != 0) {
            tKnowledge.setKnowledgeGoodlinkCatMap(knowledgeGoodlinkCatMapList);
            tKnowledge.setShopName(knowledgeGoodlinkCatMapList.get(0).getShopName());
            tKnowledge.setShop_id(String.valueOf(knowledgeGoodlinkCatMapList.get(0).getShopId()));
            StringBuffer factorys = new StringBuffer();
            for (KnowledgeGoodlinkCatMap knowledgeGoodlinkCatMap : knowledgeGoodlinkCatMapList) {
                factorys.append(knowledgeGoodlinkCatMap.getGoodslinkId()).append(",");
            }
            tKnowledge.setGoodlinkName(factorys.toString());
        }
        return tKnowledge;
    }
}
