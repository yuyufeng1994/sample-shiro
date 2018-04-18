package top.yuyufeng.sample.admin.action.authority;

import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.yuyufeng.sample.admin.orm.po.PermissionInfo;
import top.yuyufeng.sample.admin.orm.vo.JsonResult;
import top.yuyufeng.sample.admin.orm.vo.TreeVO;
import top.yuyufeng.sample.admin.service.IAuthorService;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/4/18.
 */
@Controller
@RequiresRoles("admin")
@RequestMapping("/authority/permission")
public class PermissionAction {

    @Autowired
    private IAuthorService authorService;

    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    public @ResponseBody
    JsonResult<List<TreeVO>> listPermissionTree(){
        List<TreeVO> treeVOList = authorService.getPermissionTree();
        return new JsonResult(true,"获取成功",treeVOList);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public @ResponseBody JsonResult<PermissionInfo> updatePermission(@RequestBody PermissionInfo permissionInfo){
        PermissionInfo result = authorService.updatePermission(permissionInfo);
        return new JsonResult(true,"获取成功",result);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public @ResponseBody JsonResult<PermissionInfo> addPermission(@RequestBody PermissionInfo permissionInfo){
        PermissionInfo result = authorService.addPermission(permissionInfo);
        return new JsonResult(true,"获取成功",result);
    }

    @RequestMapping(value = "/delete/{permissionId}", method = RequestMethod.GET)
    public @ResponseBody JsonResult<PermissionInfo> deletePermission(@PathVariable("permissionId") Long permissionId){
        authorService.deletePermission(permissionId);
        return new JsonResult(true,"获取成功");
    }

    /**
     * 获取权限分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody
    JsonResult<PageInfo<PermissionInfo>> listPermission(Integer pageNum) {
        return new JsonResult<>(true,"获取成功",authorService.pagePermission(pageNum));
    }


    /**
     * 跳转到权限管理页面
     *
     * @return
     */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String toPagePermission() {
        return "admin/authority/permission";
    }

}
