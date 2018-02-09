package top.yuyufeng.learn.shiro.dao;

import top.yuyufeng.learn.shiro.orm.po.PermissionInfo;

public interface PermissionInfoMapper {
    int deleteByPrimaryKey(Long permissionId);

    int insert(PermissionInfo record);

    int insertSelective(PermissionInfo record);

    PermissionInfo selectByPrimaryKey(Long permissionId);

    int updateByPrimaryKeySelective(PermissionInfo record);

    int updateByPrimaryKey(PermissionInfo record);
}