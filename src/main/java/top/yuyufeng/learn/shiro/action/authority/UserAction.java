package top.yuyufeng.learn.shiro.action.authority;

import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.yuyufeng.learn.shiro.orm.po.UserInfo;
import top.yuyufeng.learn.shiro.service.UserService;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
@RequiresRoles("admin")
@RequestMapping("/authority/user")
public class UserAction {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toList(){
        return "admin/authority/user";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public @ResponseBody
    PageInfo<UserInfo> toList(Integer pageNum){
        return userService.page(pageNum);
    }


}
