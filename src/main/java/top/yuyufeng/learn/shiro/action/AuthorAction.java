package top.yuyufeng.learn.shiro.action;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import top.yuyufeng.learn.shiro.orm.po.PermissionInfo;
import top.yuyufeng.learn.shiro.orm.po.RoleInfo;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;
import top.yuyufeng.learn.shiro.orm.po.UserRoleInfo;
import top.yuyufeng.learn.shiro.service.AuthorService;
import top.yuyufeng.learn.shiro.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
@RequiresRoles("admin")
@RequestMapping("/authority/")
public class AuthorAction {
    @Autowired
    private AuthorService authorService;

    /**
     * 跳转到用户管理页面
     *
     * @return
     */
    @RequestMapping(value = "user/page", method = RequestMethod.GET)
    public String toPageUser() {
        return "admin/authority/user";
    }

    /**
     * 跳转到角色管理页面
     *
     * @return
     */
    @RequestMapping(value = "role/page", method = RequestMethod.GET)
    public String toPageRole() {
        return "admin/authority/role";
    }

    /**
     * 跳转到权限管理页面
     *
     * @return
     */
    @RequestMapping(value = "permission/page", method = RequestMethod.GET)
    public String toPagePermission() {
        return "admin/authority/permission";
    }

    /**
     * 获取用户分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "user/list", method = RequestMethod.GET)
    public @ResponseBody
    PageInfo<UserInfo> listUser(Integer pageNum) {
        return authorService.pageUser(pageNum);
    }

    /**
     * 获取角色分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "role/list", method = RequestMethod.GET)
    public @ResponseBody
    PageInfo<RoleInfo> listRole(Integer pageNum) {
        return authorService.pageRole(pageNum);
    }

    /**
     * 获取权限分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "permission/list", method = RequestMethod.GET)
    public @ResponseBody
    PageInfo<PermissionInfo> listPermission(Integer pageNum) {
        return authorService.pagePermission(pageNum);
    }

    /**
     * 获取用户角色数据
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "role/list/{userId}", method = RequestMethod.GET)
    public @ResponseBody
    List<RoleInfo> listRoleByUserId(@PathVariable("userId") Long userId) {
        return authorService.listRole(userId);
    }

    /**
     * 修改用户角色数据
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "user/role-edit/{userId}", method = RequestMethod.POST)
    public @ResponseBody
    Integer editRoleByUserId(@PathVariable("userId") Long userId, @RequestParam(value = "roleIds[]", required = false) Long[] roleIds, HttpServletRequest request) {
        List<UserRoleInfo> userRoleInfoList = new ArrayList<>();
        for (Long roleId : roleIds) {
            UserRoleInfo userRoleInfo = new UserRoleInfo();
            userRoleInfo.setUserId(userId);
            userRoleInfo.setRoleId(roleId);
            userRoleInfoList.add(userRoleInfo);
        }
        return authorService.editUserRole(userRoleInfoList);
    }



}
