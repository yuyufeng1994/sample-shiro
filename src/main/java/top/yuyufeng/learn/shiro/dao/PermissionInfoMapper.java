package top.yuyufeng.learn.shiro.dao;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.learn.shiro.orm.po.PermissionInfo;

import java.util.List;

public interface PermissionInfoMapper extends Mapper<PermissionInfo> {

    int insertAndBackGeneratedKey(PermissionInfo permissionInfo);

    void deleteByIds(@Param("PermissionInfoList") List<PermissionInfo> PermissionInfoList);
}