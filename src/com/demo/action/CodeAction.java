package com.demo.action;

import com.demo.Po.UserPo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.xm.client.AuthCode;
import net.xm.client.UserDevice;
import net.xm.client.bean.AuthCodeVo;
import net.xm.client.bean.DeviceVo;
import net.xm.client.bean.authcode.AuthCodeBean;
import net.xm.client.bean.device.DeviceBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

import static org.apache.struts2.ServletActionContext.*;

/**
 * Created by Administrator on 2016-07-08.
 */
@Controller("code")
@Scope("prototype")
public class CodeAction extends ActionSupport{
    private String uuid;//开发者唯一标识符
    private String type;//需要申请的类型：css，dss，p2p，pms，tps
    private UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");

    public void open() throws Exception {
        AuthCode code = AuthCode.newInstance();
        AuthCodeVo vo = code.appVo(uuid, type, userPo.getUserId(), userPo.getName(), userPo.getPassword());
        getResponse().getWriter().print(vo.getCode());
    }

    public String select() throws Exception {
        List<AuthCodeBean> authCodeBeans=new ArrayList<AuthCodeBean>();
        AuthCode code = AuthCode.newInstance();
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        DeviceVo vo = userDevice.listVo(userPo.getUserId(), userPo.getName(), userPo.getPassword());
        List<DeviceBean> list=vo.getData().getData();
            for(DeviceBean dvo:list){
            AuthCodeVo vo1 = code.queryVo(dvo.getUuid(), userPo.getUserId(), userPo.getName(), userPo.getPassword());
            AuthCodeBean authCodeBean=new AuthCodeBean();
            for(AuthCodeBean authCodeBean1:vo1.getData())
            {
                authCodeBeans.add(authCodeBean1);
            }
        }
        ActionContext.getContext().getSession().put("deviceCode",authCodeBeans);
        return "success";
    }

    public void codetongbu() throws Exception {
        AuthCode code = AuthCode.newInstance();
        AuthCodeVo vo = code.synVo(uuid, userPo.getUserId(), userPo.getName(), userPo.getPassword());
    }


    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
