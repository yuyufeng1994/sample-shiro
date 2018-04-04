package top.yuyufeng.learn.shiro.dao;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.learn.shiro.orm.po.UserRoleInfo;

import java.util.List;

public interface UserRoleInfoMapper extends Mapper<UserRoleInfo> {

    Integer insertUserRoleBatch(@Param("userRoleInfoList") List<UserRoleInfo> userRoleInfoList);

}