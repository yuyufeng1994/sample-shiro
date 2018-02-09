package top.yuyufeng.learn.shiro.dao;

import top.yuyufeng.learn.shiro.orm.po.UserRoleInfo;

public interface UserRoleInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserRoleInfo record);

    int insertSelective(UserRoleInfo record);

    UserRoleInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRoleInfo record);

    int updateByPrimaryKey(UserRoleInfo record);
}