package com.lin.ssm.common.controller;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

/**
 * 基础Controller
 * @author 林
 */
public abstract class BaseController {
    @Autowired
    protected HttpSession session;
}
