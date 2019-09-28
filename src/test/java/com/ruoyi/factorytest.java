package com.ruoyi;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.project.system.kbm.domain.TKnowledge;
import com.ruoyi.project.system.kbm.domain.TProductFactory;
import com.ruoyi.project.system.kbm.mapper.TKnowledgeMapper;
import com.ruoyi.project.system.kbm.mapper.TProductFactoryMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class factorytest {


    @Resource
    private TKnowledgeMapper TKnowledgeMapper;

    @Resource
    private TProductFactoryMapper tProductFactoryMapper;

    @Test
    public void test(){
        List<TKnowledge> knowledgeList = TKnowledgeMapper.selectTKnowledgeList(new TKnowledge());
        List<TProductFactory> productFactories = tProductFactoryMapper.selectTProductFactoryList(new TProductFactory());
        for (TKnowledge tKnowledge : knowledgeList) {
            if (StringUtils.isNotEmpty(tKnowledge.getProductFactory())) {
                boolean flag = false;
                for (TProductFactory productFactory : productFactories) {
                    if (tKnowledge.getProductFactory().trim().equals(productFactory.getName().trim())) {
                        flag = true;
                        TKnowledge tKnowledge1 = new TKnowledge();
                        tKnowledge1.setProductFactory(String.valueOf(productFactory.getId()));
                        tKnowledge1.setId(tKnowledge.getId());
                        TKnowledgeMapper.updateTKnowledge(tKnowledge1);
                        break;
                    }
                }
                if (flag==false){
                    System.out.println(tKnowledge.getProductFactory());
//                    TProductFactory tProductFactory = new TProductFactory();
//                    tProductFactory.setName(tKnowledge.getProductFactory());
//                    tProductFactoryMapper.insertTProductFactory(tProductFactory);
//                    System.out.println(tProductFactory);
                }
            }
        }
    }
}
