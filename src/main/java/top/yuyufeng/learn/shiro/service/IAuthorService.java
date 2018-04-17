package top.yuyufeng.learn.shiro.service;


import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.yuyufeng.learn.shiro.orm.po.PermissionInfo;
import top.yuyufeng.learn.shiro.orm.po.RoleInfo;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;
import top.yuyufeng.learn.shiro.orm.po.UserRoleInfo;
import top.yuyufeng.learn.shiro.orm.vo.TreeVO;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/11
 */
public interface IAuthorService {

    PageInfo<UserInfo> pageUser(Integer pageNum);

    PageInfo<RoleInfo> pageRole(Integer pageNum);

    PageInfo<PermissionInfo> pagePermission(Integer pageNum);

    List<RoleInfo> listRole(Long userId);

    @Transactional(rollbackFor = Exception.class)
    Integer editUserRole(List<UserRoleInfo> userRoleInfoList);

    /**
     * 获取权限树
     * @return
     */
    List<TreeVO> getPermissionTree();

    PermissionInfo updatePermission(PermissionInfo permissionInfo);

    PermissionInfo addPermission(PermissionInfo permissionInfo);


    void deletePermission(Long permissionId);
}
