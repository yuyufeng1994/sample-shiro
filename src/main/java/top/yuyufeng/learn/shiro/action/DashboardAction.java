package top.yuyufeng.learn.shiro.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
@RequestMapping("/admin/dashboard")
public class DashboardAction {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String toIndex(){
        return "admin/dashboard/index";
    }

}
