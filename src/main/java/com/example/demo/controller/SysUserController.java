package com.example.demo.controller;

import com.example.demo.constant.UserConstants;
import com.example.demo.model.AjaxResult;
import com.example.demo.model.SysUser;
import com.example.demo.service.SysPasswordService;
import com.example.demo.service.SysUserService;
import com.example.demo.utils.Md5Encoder;
import com.example.demo.utils.ShiroUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class SysUserController {
    @Autowired
    SysUserService userService;

    @Autowired
    SysPasswordService passwordService;

    @GetMapping("/list")
    public SysUser list(Long userId){
        SysUser list = userService.list(userId);
        return list;
    }


    @PostMapping("/add")
    public AjaxResult addSave( SysUser user)
    {
        if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(user.getLoginName())))
        {
            return AjaxResult.error("新增用户'" + user.getLoginName() + "'失败，登录账号已存在");
        }
        else if (StringUtils.isNotEmpty(user.getPhonenumber())
                && UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return AjaxResult.error("新增用户'"
                    + user.getLoginName() + "'失败，手机号码已存在");
        }
        else if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
        {
            return AjaxResult.error("新增用户'" + user.getLoginName() + "'失败，邮箱账号已存在");
        }
        user.setSalt(ShiroUtils.randomSalt());
//        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
        user.setPassword(Md5Encoder.getMd5(user.getPassword()+user.getSalt()));
//        user.setCreateBy(ShiroUtils.getLoginName());
        return AjaxResult.success(userService.insertUser(user));
    }

}


