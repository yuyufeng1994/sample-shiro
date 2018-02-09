package top.yuyufeng.learn.shiro.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
@RequestMapping("/message")
public class MessageAction {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String toIndex(){
        return "admin/message/index";
    }

    @RequestMapping(value = "/send",method = RequestMethod.GET)
    public String toSend(){
        return "admin/message/send";
    }

}
