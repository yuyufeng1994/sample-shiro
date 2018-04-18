package top.yuyufeng.sample.admin.dao;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.sample.admin.orm.po.RolePermissionInfo;

import java.util.List;

public interface RolePermissionInfoMapper extends Mapper<RolePermissionInfo> {

    /**
     * 批量插入
     * @param rolePermissionInfos
     */
    void insertBatch(@Param("rolePermissionInfos") List<RolePermissionInfo> rolePermissionInfos);

}