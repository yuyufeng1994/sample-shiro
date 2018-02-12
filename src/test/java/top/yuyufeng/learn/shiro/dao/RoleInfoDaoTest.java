package top.yuyufeng.learn.shiro.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.yuyufeng.learn.shiro.orm.po.RoleInfo;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/9
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class RoleInfoDaoTest {
    @Autowired
    private RoleInfoMapper roleInfoMapper ;

    @Test
    public void test(){

    }


    @Test
    public void testPage(){
        PageHelper.startPage(1, 10);
        List<RoleInfo> list = roleInfoMapper.list();
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(list,8);
        System.out.println(pageInfo);

    }



    @Test
    public void testGet(){
        List<RoleInfo> list = roleInfoMapper.listByUserId(1L);
        for (RoleInfo roleInfo : list) {
            System.out.println(roleInfo);
        }
    }

}
