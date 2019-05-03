package com.lin.ssm.system.controller;

import com.lin.ssm.common.controller.BaseController;
import com.lin.ssm.common.model.Res;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 林
 */
@Controller
public class IndexController extends BaseController {
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
}