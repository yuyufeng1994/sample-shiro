package top.yuyufeng.sample.admin.action.authority;

import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.yuyufeng.sample.admin.orm.po.RoleInfo;
import top.yuyufeng.sample.admin.orm.po.RolePermissionInfo;
import top.yuyufeng.sample.admin.orm.vo.JsonResult;
import top.yuyufeng.sample.admin.orm.vo.TreeVO;
import top.yuyufeng.sample.admin.service.IAuthorService;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
@RequiresRoles("admin")
@RequestMapping("/authority/role")
public class RoleAction {

    @Autowired
    private IAuthorService authorService;

    /**
     * 跳转到角色管理页面
     *
     * @return
     */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String toPageRole() {
        return "admin/authority/role";
    }

    /**
     * 获取角色分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody
    JsonResult<PageInfo<RoleInfo>> listRole(Integer pageNum) {
        return new JsonResult<>(true, "获取成功", authorService.pageRole(pageNum));
    }

    /**
     * 获取用户角色数据
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "/list/{userId}", method = RequestMethod.GET)
    public @ResponseBody
    JsonResult<List<RoleInfo>> listRoleByUserId(@PathVariable("userId") Long userId) {
        return new JsonResult<>(true, "获取成功", authorService.listRole(userId));
    }

    @RequestMapping(value = "test/tree", method = RequestMethod.POST)
    public @ResponseBody
    JsonResult<TreeVO> testTree(@RequestBody TreeVO treeVO) {
        treeVO.setText("权限1");
        return new JsonResult<>(true, "获取成功", treeVO);
    }

    @RequestMapping(value = "/tree/{roleId}", method = RequestMethod.GET)
    public @ResponseBody
    JsonResult<List<TreeVO>> listPermissionTree(@PathVariable("roleId") Long roleId) {
        List<TreeVO> treeVOList = authorService.getPermissionTree(roleId);
        return new JsonResult(true, "获取成功", treeVOList);
    }


    @RequestMapping(value = "/permissions", method = RequestMethod.POST)
    public @ResponseBody
    JsonResult save( @RequestBody List<RolePermissionInfo> rolePermissionInfos) {
        try{
            authorService.updateRolePermissions(rolePermissionInfos);
            return new JsonResult(true, "获取成功");
        }catch (Exception e){
            e.printStackTrace();
            return new JsonResult(false, "修改失败");
        }
    }



}
