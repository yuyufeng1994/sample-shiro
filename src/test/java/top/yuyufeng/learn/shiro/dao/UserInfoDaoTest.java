package top.yuyufeng.learn.shiro.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;

/**
 * @author yuyufeng
 * @date 2018/2/9
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserInfoDaoTest {
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Test
    public void test(){

    }

    @Test
    public void testGet(){
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(1L);
        System.out.println(userInfo);
    }

}
