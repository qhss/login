package com.example.demo.config.shiro;

import com.example.demo.model.SysMenu;
import com.example.demo.model.SysUser;
import com.example.demo.service.SysMenuService;
import com.example.demo.service.SysRoleService;
import com.example.demo.service.SysUserService;
import com.example.demo.utils.StringUtils;
import jdk.nashorn.internal.runtime.regexp.joni.Config;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class MySystemRealm extends AuthorizingRealm {
    @Autowired
    SysUserService userService;

    @Autowired
    SysMenuService menuService;

    @Autowired
    SysRoleService roleService;



    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        String currentLoginName = (String) principals.getPrimaryPrincipal();
        List<String> userRoles = new ArrayList<String>();
        List<String> userPermissions = new ArrayList<String>();
        //从数据库中获取当前登录用户的详细信息

       SysUser userResult=userService.findUserByLoginName(currentLoginName);
//        if(userResult!=null ) {
//            //如果酒店id不为空，判断酒店状态
//            if(!StringUtils.isBlank(user.getHotelId())) {
//                ServiceResult<Hotel> hotelOPtionResult=hotelService.findById(user.getHotelId());
//                if(!hotelOPtionResult.isSuccess() || hotelOPtionResult.getData().getCanceled()==Hotel.CANCEL_STATE_CENCELED ||
//                        hotelOPtionResult.getData().getDeleted()==Hotel.DELETE_STATE_DELETED) {
//
//                    throw new AuthorizationException();
//                }
//            }
//
//            //获取当前用户下拥有的所有角色列表
//            ServiceResult<List<Role>> userRoleOption= roleService.queryRolesByUserId(user.getId());
//            if(userRoleOption.isSuccess()) {
//                for (Role role : userRoleOption.getData()) {
//                    userRoles.add(role.getName());
//                }
//            }
//            //暂时用不着,先加一个固定值,需要时再实现
//        } else {
//            throw new AuthorizationException();
//        }

        // 为当前用户设置角色和权限
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addRoles(userRoles);
        authorizationInfo.addStringPermissions(userPermissions);
        return authorizationInfo;
    }

    /**
     * 验证当前登录的Subject LoginController.login()方法中执行Subject.login()时 执行此方法
     */

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {


        String loginName = (String) authcToken.getPrincipal();
        SysUser userResult=userService.findUserByLoginName(loginName);
        if(userResult==null)
            throw new UnknownAccountException();//没找到帐号
        ;
        //设置菜单
        Long userId=userResult.getUserId();
//        List<SysMenu> menus=menuService.queryMenu(userId);
//
//        if(menus!=null)
//            user.setHisMenus(new MenuUtil(menus).buildTree());

        SecurityUtils.getSubject().getSession().setAttribute("user",userResult);

        SimpleAuthenticationInfo authenticationInfo =
                new SimpleAuthenticationInfo(
                        userResult,
                        userResult.getPassword()+userResult.getSalt(),
                        ByteSource.Util.bytes(userResult.getSalt()),//salt
                        userResult.getUserName()==null?"":userResult.getUserName() //realm name
                );

        return authenticationInfo;
    }

}
