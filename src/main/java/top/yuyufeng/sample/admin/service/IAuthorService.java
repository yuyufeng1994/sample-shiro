package top.yuyufeng.sample.admin.service;


import com.github.pagehelper.PageInfo;
import org.springframework.transaction.annotation.Transactional;
import top.yuyufeng.sample.admin.orm.po.*;
import top.yuyufeng.sample.admin.orm.vo.TreeVO;

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
     * @param roleId
     * @return
     */
    List<TreeVO> getPermissionTree(Long roleId);

    PermissionInfo updatePermission(PermissionInfo permissionInfo);

    PermissionInfo addPermission(PermissionInfo permissionInfo);


    void deletePermission(Long permissionId);

    /**
     *
     * @param rolePermissionInfos
     */
    void updateRolePermissions(List<RolePermissionInfo> rolePermissionInfos);
}
