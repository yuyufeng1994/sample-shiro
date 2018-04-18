package top.yuyufeng.sample.admin.action.authority;

import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.yuyufeng.sample.admin.orm.po.UserInfo;
import top.yuyufeng.sample.admin.orm.po.UserRoleInfo;
import top.yuyufeng.sample.admin.orm.vo.JsonResult;
import top.yuyufeng.sample.admin.service.IAuthorService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/4/18.
 */
@Controller
@RequiresRoles("admin")
@RequestMapping("/authority/user")
public class UserAction {
    @Autowired
    private IAuthorService authorService;

    /**
     * 跳转到用户管理页面
     *
     * @return
     */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String toPageUser() {
        return "admin/authority/user";
    }


    /**
     * 获取用户分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody
    JsonResult<PageInfo<UserInfo>> listUser(Integer pageNum) {
        return new JsonResult<>(true,"获取成功",authorService.pageUser(pageNum));
    }


    /**
     * 修改用户角色数据
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "/role-edit/{userId}", method = RequestMethod.POST)
    public @ResponseBody
    JsonResult editRoleByUserId(@PathVariable("userId") Long userId, @RequestParam(value = "roleIds[]", required = false) Long[] roleIds, HttpServletRequest request) {
        List<UserRoleInfo> userRoleInfoList = new ArrayList<>();
        for (Long roleId : roleIds) {
            UserRoleInfo userRoleInfo = new UserRoleInfo();
            userRoleInfo.setUserId(userId);
            userRoleInfo.setRoleId(roleId);
            userRoleInfoList.add(userRoleInfo);
        }
        authorService.editUserRole(userRoleInfoList);
        return new JsonResult(true);
    }

}
