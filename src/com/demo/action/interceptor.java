package com.demo.action;

import com.demo.Po.UserPo;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016-07-27.
 */
public class interceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UserPo userPo = (UserPo) session.getAttribute("user");
        if (null == session.getAttribute("user")){
            return "login";
        }
        else {
            return actionInvocation.invoke();
        }
    }
}
