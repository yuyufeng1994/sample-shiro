package top.yuyufeng.learn.shiro.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.yuyufeng.learn.shiro.constant.CommonConfig;
import top.yuyufeng.learn.shiro.dao.UserInfoMapper;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/9
 */
@Service
public class UserService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    public PageInfo<UserInfo> page(int pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE, "user_id asc");
        List<UserInfo> list = userInfoMapper.list();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }
}
