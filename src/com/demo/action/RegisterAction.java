package com.demo.action;

import com.demo.Po.UserPo;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import net.xm.client.SendCode;
import net.xm.client.User;
import net.xm.client.bean.CheckUsernameVo;
import net.xm.client.bean.SendCodeVo;
import net.xm.client.bean.UserRegVo;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static org.apache.struts2.ServletActionContext.getRequest;
import static org.apache.struts2.ServletActionContext.getResponse;


/**
 * Created by Administrator on 2016-07-06.
 */
@Controller("register")
@Scope("prototype")
public class RegisterAction extends ActionSupport {

    private UserPo user;
    private String verCode;
    private String info;


    /**
     * 发送邮箱验证码
     * @throws Exception
     */
    public void mailsend() throws Exception {
        User clinet=User.newInstance();
        JSONObject jot=JSONObject.fromObject(clinet.checkMail(user.getMail()));
        int code=0;
        code=jot.getInt("code");
        if(code==4024){//4024   该邮箱没有被注册
            SendCode  clinet1 = SendCode .newInstance();
            SendCodeVo vo=clinet1.mailVo(user.getMail(),"re");
            code=vo.getCode();
        }else {
            code=jot.getInt("code");
        }
        getResponse().getWriter().print(code);
    }
    /**
     * 发送手机验证码（注册）
     * @throws Exception
     */
    public void phonesend() throws Exception {
        int code=0;
        User clinet=User.newInstance();
        SendCode client = SendCode.newInstance();
        JSONObject jot2=JSONObject.fromObject(clinet.checkPhoneVo(user.getPhone()));
        JSONObject jot1;
        if(jot2.getInt("code")==4022){//4022  表示该手机没有注册
            jot1=JSONObject.fromObject(client.phone(user.getPhone(),"re"));
            code=jot1.getInt("code");
        }else {
            code=jot2.getInt("code");
        }
        getResponse().getWriter().print(code);
    }
    /**
     * 综合注册
     */
    public void regeister() throws Exception {
        if(user.getMail().isEmpty()||user.getMail().length()==0)
        {
            //手机注册
            int code=0;
            User clinet = User.newInstance();
            CheckUsernameVo namevo=clinet.checkUsernameVo(user.getName());
            int nameCode=namevo.getCode();
            if(nameCode!=4025){//4025   表示用户名已经注册
                code=nameCode;
            }else {
                User client = User.newInstance();
                UserRegVo vo = client.regPhoneVo(user.getName(), user.getPassword(),
                        user.getConfirmPass(), user.getPhone(), verCode);
                code = vo.getCode();
            }
            getResponse().getWriter().print(code);
        }else{
            //邮箱注册
            int code=0;
            User clinet = User.newInstance();
            CheckUsernameVo namevo=clinet.checkUsernameVo(user.getName());
            int nameCode=namevo.getCode();
            if(nameCode!=4025){
                code=nameCode;
            }else {
                User client = User.newInstance();
                UserRegVo vo=client.regMailVo(user.getName(), user.getPassword(),
                        user.getConfirmPass(),user.getMail(), verCode);
                code=vo.getCode();
            }
            getResponse().getWriter().print(code);
        }
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public UserPo getUser() {
        return user;
    }

    public void setUser(UserPo user) {
        this.user = user;
    }

    public String getVerCode() {
        return verCode;
    }

    public void setVerCode(String verCode) {
        this.verCode = verCode;
    }
}
