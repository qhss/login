package com.example.demo.controller;

import cn.hutool.crypto.SecureUtil;
import com.example.demo.model.AjaxResult;
import com.example.demo.model.SysUser;
import com.example.demo.service.SysUserService;
import com.example.demo.utils.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {
    @Autowired
    SysUserService sysUserService;

    @PostMapping("/login")
    public AjaxResult ajaxLogin(String username, String password)
    {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            return AjaxResult.success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return AjaxResult.error(msg);
        }
    }
    /**
     * 验证用户密码
     * @param user
     * @param password
     * @return
     */
    public boolean match(SysUser user, String password) {

        boolean b = user.getPassword().equals(SecureUtil.sha1(password));
        return  b;
    }

}
