package top.yuyufeng.sample.admin.dao;

import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.sample.admin.orm.po.RoleInfo;

import java.util.List;

public interface RoleInfoMapper extends Mapper<RoleInfo> {
    List<RoleInfo> listByUserId(Long userId);
}