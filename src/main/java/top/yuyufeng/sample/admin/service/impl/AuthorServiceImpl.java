package top.yuyufeng.sample.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.yuyufeng.sample.admin.constant.CommonConfig;
import top.yuyufeng.sample.admin.dao.*;
import top.yuyufeng.sample.admin.orm.po.*;
import top.yuyufeng.sample.admin.orm.vo.TreeVO;
import top.yuyufeng.sample.admin.service.IAuthorService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/11
 */
@Service
public class AuthorServiceImpl implements IAuthorService {
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private RoleInfoMapper roleInfoMapper;
    @Autowired
    private UserRoleInfoMapper userRoleInfoMapper;
    @Autowired
    private PermissionInfoMapper permissionInfoMapper;
    @Autowired
    private RolePermissionInfoMapper rolePermissionInfoMapper;

    /**
     * 获取所有用户分页
     *
     * @param pageNum
     * @return
     */
    @Override
    public PageInfo<UserInfo> pageUser(Integer pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE);
        List<UserInfo> list = userInfoMapper.selectAll();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }

    /**
     * 获取所有角色分页
     *
     * @param pageNum
     * @return
     */
    @Override
    public PageInfo<RoleInfo> pageRole(Integer pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE);
        List<RoleInfo> list = roleInfoMapper.selectAll();
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }

    /**
     * 获取所有权限分页
     *
     * @param pageNum
     * @return
     */
    @Override
    public PageInfo<PermissionInfo> pagePermission(Integer pageNum) {
        PageHelper.startPage(pageNum, CommonConfig.PAGE_SIZE);
        List<PermissionInfo> list = permissionInfoMapper.selectAll();
        PageInfo<PermissionInfo> pageInfo = new PageInfo<>(list, CommonConfig.NAVIGATE_PAGES);
        return pageInfo;
    }

    @Override
    public List<RoleInfo> listRole(Long userId) {
        return roleInfoMapper.listByUserId(userId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer editUserRole(List<UserRoleInfo> userRoleInfoList) {
        //删除用户原先的权限
        UserRoleInfo userRoleInfo = new UserRoleInfo();
        userRoleInfo.setUserId(userRoleInfoList.get(0).getUserId());
        userRoleInfoMapper.delete(userRoleInfo);
        //插入用户权限
        return userRoleInfoMapper.insertUserRoleBatch(userRoleInfoList);
    }

    @Override
    public List<TreeVO> getPermissionTree(Long roleId) {
        List<PermissionInfo> permissionInfos = permissionInfoMapper.selectAllWithStatus(roleId);
        List<TreeVO> treeList = new ArrayList<>();
        for (int i = 0; i < permissionInfos.size(); i++) {
            PermissionInfo permissionInfo = permissionInfos.get(i);
            if (permissionInfo.getParentId() == null) {
                TreeVO treeVO = new TreeVO();
                treeVO.setDataId(permissionInfo.getPermissionId());
                treeVO.setText(permissionInfo.getPermissionNotes());
                treeVO.setName(permissionInfo.getPermissionName());
                treeVO.setDataParent(permissionInfo.getParentId());
                treeVO.addState("checked", permissionInfo.getChecked());
                findChilds(treeVO, permissionInfos);
                treeList.add(treeVO);
            }
        }
        return treeList;
    }

    @Override
    public PermissionInfo updatePermission(PermissionInfo permissionInfo) {
        permissionInfoMapper.updateByPrimaryKeySelective(permissionInfo);
        return permissionInfoMapper.selectByPrimaryKey(permissionInfo.getPermissionId());
    }

    @Override
    public PermissionInfo addPermission(PermissionInfo permissionInfo) {
        permissionInfoMapper.insertAndBackGeneratedKey(permissionInfo);
        return permissionInfo;
    }

    private void findChilds(TreeVO treeVO, List<PermissionInfo> permissionInfos) {
        List<TreeVO> treeChilds = new ArrayList<>();
        for (int i = 0; i < permissionInfos.size(); i++) {
            PermissionInfo permissionInfo = permissionInfos.get(i);
            if(permissionInfo.getParentId() != null){
                if (permissionInfo.getParentId().equals(treeVO.getDataId())) {
                    TreeVO treeChild = new TreeVO();
                    treeChild.setDataId(permissionInfo.getPermissionId());
                    treeChild.setDataParent(permissionInfo.getParentId());
                    treeChild.setText(permissionInfo.getPermissionNotes());
                    treeChild.setName(permissionInfo.getPermissionName());
                    treeChild.addState("checked", permissionInfo.getChecked());
                    findChilds(treeChild, permissionInfos);
                    treeChilds.add(treeChild);
                }
            }
        }
        if (treeChilds != null && treeChilds.size() > 0) {
            treeVO.setNodes(treeChilds);
        }
    }

    @Override
    public void deletePermission(Long permissionId) {
        List<PermissionInfo> permissionInfos = permissionInfoMapper.selectAll();
        List<PermissionInfo> results = new ArrayList<>();
        PermissionInfo permissionInfo = new PermissionInfo();
        permissionInfo.setPermissionId(permissionId);
        results.add(permissionInfo);
        findNodeChilds(permissionId, results, permissionInfos);
        permissionInfoMapper.deleteByIds(results);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateRolePermissions(List<RolePermissionInfo> rolePermissionInfos) {
        if(rolePermissionInfos == null || rolePermissionInfos.size() == 0){
            return;
        }
        RolePermissionInfo rolePermissionInfo = new RolePermissionInfo();
        rolePermissionInfo.setRoleId(rolePermissionInfos.get(0).getRoleId());
        rolePermissionInfoMapper.delete(rolePermissionInfo);
        rolePermissionInfoMapper.insertBatch(rolePermissionInfos);
    }

    private void findNodeChilds(Long id, List<PermissionInfo> results, List<PermissionInfo> permissionInfos) {
        for (PermissionInfo permissionInfo : permissionInfos) {
            if (permissionInfo.getParentId().equals(id)) {
                results.add(permissionInfo);
                findNodeChilds(permissionInfo.getPermissionId(), results, permissionInfos);
            }
        }
    }
}
