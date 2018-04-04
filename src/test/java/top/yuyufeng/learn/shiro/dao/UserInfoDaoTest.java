package top.yuyufeng.learn.shiro.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;

import java.util.List;

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
    public void testPage(){
        PageHelper.startPage(1, 10, "user_id asc");
        List<UserInfo> list = userInfoMapper.selectAll();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(list,8);
        System.out.println(pageInfo);

    }

    @Test
    public void testInsert(){
        for (int i = 50; i < 200; i++) {
            UserInfo record = new UserInfo(null,"yy"+i,"12345");
            userInfoMapper.insertSelective(record);
        }
    }

    @Test
    public void testList(){
        PageHelper.startPage(1, 10, "user_id asc");
        List<UserInfo> list = userInfoMapper.selectAll();
        for (UserInfo userInfo : list) {
            System.out.println(userInfo);
        }

    }

    @Test
    public void testGet(){
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(1L);
        System.out.println(userInfo);
    }

}
