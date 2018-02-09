package top.yuyufeng.learn.shiro.dao;

import top.yuyufeng.learn.shiro.orm.po.RoleInfo;

public interface RoleInfoMapper {
    int deleteByPrimaryKey(Long roleId);

    int insert(RoleInfo record);

    int insertSelective(RoleInfo record);

    RoleInfo selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(RoleInfo record);

    int updateByPrimaryKey(RoleInfo record);
}