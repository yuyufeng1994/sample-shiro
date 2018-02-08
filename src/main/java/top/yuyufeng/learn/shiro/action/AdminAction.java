package top.yuyufeng.learn.shiro.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
public class AdminAction {

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String toAdmin(){
        return "admin/index";
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String toHome(){
        return "home";
    }
}
