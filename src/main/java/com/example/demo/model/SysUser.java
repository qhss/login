package com.example.demo.model;

import com.example.demo.common.annotation.Excel;
import com.example.demo.common.annotation.Excels;
import com.fasterxml.jackson.databind.ser.Serializers;
import lombok.Data;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;
@Data
//@Table(name="sys_user")
public class SysUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;

    /** 部门ID */
    private Long deptId;

    /** 部门父ID */
    private Long parentId;

    /** 角色ID */
    private Long roleId;

    /** 登录名称 */
    private String loginName;

    /** 用户名称 */
    private String userName;

    /** 用户类型 */
    private String userType;

    /** 用户邮箱 */
    private String email;

    /** 手机号码 */
    private String phonenumber;

    /** 用户性别 */
    private String sex;

    /** 用户头像 */
    private String avatar;

    /** 密码 */
    private String password;

    /** 盐加密 */
    private String salt;

    /** 帐号状态（0正常 1停用） */
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 最后登录IP */
    private String loginIp;

    /** 最后登录时间 */
    private Date loginDate;

    /** 密码最后更新时间 */
    private Date pwdUpdateDate;


    /** 部门对象 */
    @Excels({
            @Excel(name = "部门名称", targetAttr = "deptName", type = Excel.Type.EXPORT),
            @Excel(name = "部门负责人", targetAttr = "leader", type = Excel.Type.EXPORT)
    })
    private SysDept dept;

    private List<SysRole> roles;

    /** 角色组 */
    private Long[] roleIds;

    /** 岗位组 */
    private Long[] postIds;


}
