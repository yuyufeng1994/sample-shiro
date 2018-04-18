package top.yuyufeng.sample.admin.dao;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.sample.admin.orm.po.PermissionInfo;

import java.util.List;

public interface PermissionInfoMapper extends Mapper<PermissionInfo> {

    int insertAndBackGeneratedKey(PermissionInfo permissionInfo);

    void deleteByIds(@Param("PermissionInfoList") List<PermissionInfo> PermissionInfoList);

    List<PermissionInfo> selectAllWithStatus(@Param("roleId") Long roleId);
}