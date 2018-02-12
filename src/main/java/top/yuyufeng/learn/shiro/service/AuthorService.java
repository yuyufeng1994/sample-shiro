package top.yuyufeng.learn.shiro.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.yuyufeng.learn.shiro.constant.CommonConfig;
import top.yuyufeng.learn.shiro.dao.PermissionInfoMapper;
import top.yuyufeng.learn.shiro.dao.RoleInfoMapper;
import top.yuyufeng.learn.shiro.dao.UserInfoMapper;
import top.yuyufeng.learn.shiro.dao.UserRoleInfoMapper;
import top.yuyufeng.learn.shiro.orm.po.PermissionInfo;
import top.yuyufeng.learn.shiro.orm.po.RoleInfo;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;
import top.yuyufeng.learn.shiro.orm.po.UserRoleInfo;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/11
 */
@Service
public class AuthorService {
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private RoleInfoMapper roleInfoMapper;
    @Autowired
    private UserRoleInfoMapper userRoleInfoMapper;
    @Autowired
    private PermissionInfoMapper permissionInfoMapper;

    /**
     * 获取所有用户分页
     * @param pageNum
     * @return
     */
    public PageInfo<UserInfo> pageUser(Integer pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE);
        List<UserInfo> list = userInfoMapper.list();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }

    /**
     * 获取所有角色分页
     * @param pageNum
     * @return
     */
    public PageInfo<RoleInfo> pageRole(Integer pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE);
        List<RoleInfo> list = roleInfoMapper.list();
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }

    /**
     * 获取所有权限分页
     * @param pageNum
     * @return
     */
    public PageInfo<PermissionInfo> pagePermission(Integer pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE);
        List<PermissionInfo> list = permissionInfoMapper.list();
        PageInfo<PermissionInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }


    public List<RoleInfo> listRole(Long userId) {
       return roleInfoMapper.listByUserId(userId);
    }

    public Integer editUserRole(List<UserRoleInfo> userRoleInfoList) {
        //删除用户原先的权限
        userRoleInfoMapper.deleteByUserId(userRoleInfoList.get(0).getUserId());
        //插入用户权限
        return userRoleInfoMapper.insertUserRoleBatch(userRoleInfoList);
    }
}
