package top.yuyufeng.learn.shiro.dao;

import tk.mybatis.mapper.common.Mapper;
import top.yuyufeng.learn.shiro.orm.po.RoleInfo;

import java.util.List;

public interface RoleInfoMapper extends Mapper<RoleInfo> {
    List<RoleInfo> listByUserId(Long userId);
}