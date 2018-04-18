package top.yuyufeng.sample.admin.dao;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.sample.admin.orm.po.UserRoleInfo;

import java.util.List;

public interface UserRoleInfoMapper extends Mapper<UserRoleInfo> {

    Integer insertUserRoleBatch(@Param("userRoleInfoList") List<UserRoleInfo> userRoleInfoList);

}