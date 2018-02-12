package top.yuyufeng.learn.shiro.dao;

import top.yuyufeng.learn.shiro.orm.po.UserRoleInfo;

import java.util.List;

public interface UserRoleInfoMapper {

    int deleteByPrimaryKey(Long id);

    int insert(UserRoleInfo record);

    int insertSelective(UserRoleInfo record);

    UserRoleInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRoleInfo record);

    int updateByPrimaryKey(UserRoleInfo record);

    int deleteByUserId(Long userId);

    Integer insertUserRoleBatch(List<UserRoleInfo> userRoleInfoList);
}