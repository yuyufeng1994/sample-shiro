package top.yuyufeng.learn.shiro.dao;

import top.yuyufeng.learn.shiro.orm.po.RolePermissionInfo;

public interface RolePermissionInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RolePermissionInfo record);

    int insertSelective(RolePermissionInfo record);

    RolePermissionInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RolePermissionInfo record);

    int updateByPrimaryKey(RolePermissionInfo record);
}