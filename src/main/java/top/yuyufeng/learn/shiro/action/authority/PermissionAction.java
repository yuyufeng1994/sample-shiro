package top.yuyufeng.learn.shiro.action.authority;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
@RequiresRoles("admin")
@RequestMapping("/authority/permission")
public class PermissionAction {

    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toIndex(){
        return "admin/authority/permission";
    }

}
