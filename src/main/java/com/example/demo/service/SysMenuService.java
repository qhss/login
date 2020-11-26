package com.example.demo.service;

import com.example.demo.dao.SysMenuMapper;
import com.example.demo.model.SysMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysMenuService {
    @Autowired
    SysMenuMapper sysMenuMapper;
    public List<SysMenu> normalMenuList() {
        List<SysMenu> sysMenus = sysMenuMapper.selectMenuNormalAll();
        return sysMenus;
    }

}
