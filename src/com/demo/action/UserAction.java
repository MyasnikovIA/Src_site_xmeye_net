package com.demo.action;

import com.demo.Po.UserPo;
import com.opensymphony.xwork2.ActionSupport;
import net.xm.client.FindPassword;
import net.xm.client.SendCode;
import net.xm.client.User;
import net.xm.client.bean.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

import static org.apache.struts2.ServletActionContext.getRequest;
import static org.apache.struts2.ServletActionContext.getResponse;

/**
 * Created by Administrator on 2016-07-08.
 */
@Controller("user")
@Scope("prototype")
public class UserAction extends ActionSupport {
    private String mail;
    private String verCode;
    private String phone;
    private String newPass;
    private String confirmPass;
    private String userId;
    private UserPo user;


    public String index() {
        return SUCCESS;
    }

    /**
     * 用户登录
     *
     * @return
     * @throws Exception
     */
    public void userlogin() throws Exception {
        if (user == null) {
//            return "login";
            getResponse().getWriter().print(1);
        } else {
            User client = User.newInstance();
            UserPo userPo = new UserPo();
            userPo.setPassword(user.getPassword());
            userPo.setName(user.getName());
            UserInfoVo vo = client.info2Vo(user.getName(), user.getPassword());
            if (!(vo.getMsg().equalsIgnoreCase("success"))) {
                getResponse().getWriter().print(vo.getCode());
//                return "error";
            } else {
                userPo.setUserId(vo.getData().getId());
                userPo.setMail(vo.getData().getMail());
                userPo.setPhone(vo.getData().getPhone());
                userPo.setVerCode(user.getVerCode());
                getResponse().getWriter().print(vo.getCode());
                getRequest().getSession().setAttribute("user", userPo);
                getRequest().getSession().setAttribute("username", user.getName());
//                return "success";
            }
        }
    }

    public String main() {
        return "success";
    }


    /**
     * 发送邮箱验证码（找回）
     */
    public void findmailsend() throws Exception {
        int code;
        User clinet = User.newInstance();
        CheckMailVo mailVo = clinet.checkMailVo(mail);
        if (mailVo.getCode() == 4024) {//邮箱不存在（没有注册过）
            code = 4024;
            getResponse().getWriter().print(code);
        } else {
            SendCode client = SendCode.newInstance();
/*            JSONObject jot = JSONObject.fromObject(client.mailVo(mail, "fp"));
            code=jot.getInt("code");*/
            SendCodeVo codeVo = client.mailVo(mail, "fp");
            if (codeVo.getCode() == 2000) {
                getRequest().getSession().setAttribute("userId", codeVo.getData().getUserId());
                code = codeVo.getCode();
            } else {
                code = codeVo.getCode();
            }
            getResponse().getWriter().print(code);
        }
    }

    /**
     * 手机发送验证码(找回)
     *
     * @return
     */
    public void findphonesend() throws Exception {
        int code;
        User clinet = User.newInstance();
        CheckPhoneVo phoneVo = clinet.checkPhoneVo(phone);
        if (phoneVo.getCode() == 4022) {//手机号不存在（手机没有注册）
            code = 4022;
        } else {
            SendCode client = SendCode.newInstance();
            SendCodeVo sendCodeVo = client.phoneVo(phone, "fp");
            if (sendCodeVo.getCode() == 2000) {
                getRequest().getSession().setAttribute("userId", sendCodeVo.getData().getUserId());
                code = sendCodeVo.getCode();
            } else {
                code = sendCodeVo.getCode();
            }
        }
        getResponse().getWriter().print(code);
    }

    /**
     * 找回密码
     *
     * @return
     */
    public void findpassword() throws Exception {
        if (mail.isEmpty() || mail.length() == 0) {
            //手机找回
            FindPassword client = FindPassword.newInstance();
            userId = (String) getRequest().getSession().getAttribute("userId");
            FindPasswordVo phonevo = client.byPVo(userId, phone, verCode, newPass, confirmPass);
            getResponse().getWriter().print(phonevo.getCode());
            getRequest().getSession().removeAttribute("userId");
        } else {
//            邮箱找回
            userId = (String) getRequest().getSession().getAttribute("userId");
            FindPassword client = FindPassword.newInstance();
            FindPasswordVo mailvo = client.byMVo(userId, mail, verCode, newPass, confirmPass);
            getResponse().getWriter().print(mailvo.getCode());
            getRequest().getSession().removeAttribute("userId");
        }
    }

    //    用户退出
    public String userExit() {
        HttpSession session = getRequest().getSession();
        session.removeAttribute("user");
        session.removeAttribute("username");
        return "success";
    }

    public String getMail() {
        return mail;
    }


    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getVerCode() {
        return verCode;
    }

    public void setVerCode(String verCode) {
        this.verCode = verCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public UserPo getUser() {
        return user;
    }

    public void setUser(UserPo user) {
        this.user = user;
    }

    public String getConfirmPass() {
        return confirmPass;
    }

    public void setConfirmPass(String confirmPass) {
        this.confirmPass = confirmPass;
    }

    public String getNewPass() {
        return newPass;
    }

    public void setNewPass(String newPass) {
        this.newPass = newPass;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

}
