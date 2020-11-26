package com.example.demo.controller;

import com.example.demo.model.SysMenu;
import com.example.demo.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;
    @RequestMapping("/normal/list")
    public List<SysMenu> allNormalMenu(){
        List<SysMenu> sysMenus = sysMenuService.normalMenuList();
        return sysMenus;
    }
}
