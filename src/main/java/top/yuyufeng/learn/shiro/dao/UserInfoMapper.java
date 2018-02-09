package top.yuyufeng.learn.shiro.dao;

import top.yuyufeng.learn.shiro.orm.po.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    List<UserInfo> list();
}