package top.yuyufeng.learn.shiro.action;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author yuyufeng
 * @date 2018/2/8
 */
@Controller
public class LoginAction {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String toIndex() {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    @RequestMapping(value = "/do-login", method = RequestMethod.POST)
    public String doLogin(String username, String password,boolean remember) {
        //3、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(remember);
        subject.login(token);
      /*  try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            //错误的帐号
            return "redirect:success?message=UnknownAccountException";
        } catch (IncorrectCredentialsException e) {
            //错误的凭证
            return "redirect:success?message=IncorrectCredentialsException";
        }catch (DisabledAccountException e){
            //禁用的帐号
            return "redirect:success?message=DisabledAccountException";
        }catch (ExcessiveAttemptsException e){
            //登录失败次数过多
            return "redirect:success?message=ExcessiveAttemptsException";
        }catch (ExpiredCredentialsException e){
            //过期的凭证
            return "redirect:success?message=ExpiredCredentialsException";
        }*/
        return "redirect:/dashboard/index";
    }


    @RequestMapping(value = "/do-quit", method = RequestMethod.GET)
    public String doQuit() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login";
    }


    @RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
    public String toUnauthorized() {
        return "unauthorized";
    }


    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String toSuccess(String message, Model model) {
        model.addAttribute("message", message);
        return "success";
    }

}
