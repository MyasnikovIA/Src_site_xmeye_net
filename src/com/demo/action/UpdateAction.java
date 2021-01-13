package com.demo.action;

import com.demo.Po.UserPo;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import net.xm.client.SendCode;
import net.xm.client.User;
import net.xm.client.bean.EditorPassVo;
import net.xm.client.bean.UserInfoVo;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import static org.apache.struts2.ServletActionContext.getRequest;
import static org.apache.struts2.ServletActionContext.getResponse;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016-07-08.
 */
@Controller("update")
@Scope("prototype")
public class UpdateAction extends ActionSupport{
    private String phone;
    private String mail;
    private String oldPwd;
    private String newPwd;
    private String confirmPwd;
    private String verCode;
    private UserPo user=(UserPo) getRequest().getSession().getAttribute("user");


    /**
     * 修改密码
     */
    public void updatebyname() throws Exception {
        User client = User.newInstance();
        EditorPassVo vo = client.cpVo(user.getName(), oldPwd, newPwd, confirmPwd);
        getResponse().getWriter().print(vo.getCode());
    }
    /**
     * 获取用户信息(通过userId获取)
     */
    public void usermessage() throws Exception {
        User client = User.newInstance();
        UserInfoVo vo = client.infoVo(user.getUserId());
    }
    /**
     * 获取用户信息(通过name和密码获取)
     */
    public String namemesage() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        User client = User.newInstance();
        UserInfoVo vo = client.info2Vo(userPo.getName(), userPo.getPassword());
        return "success";
    }

    public String video(){
        return "success";
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }


    public String getNewPwd() {
        return newPwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

    public String getOldPwd() {
        return oldPwd;
    }

    public void setOldPwd(String oldPwd) {
        this.oldPwd = oldPwd;
    }

    public String getConfirmPwd() {
        return confirmPwd;
    }

    public void setConfirmPwd(String confirmPwd) {
        this.confirmPwd = confirmPwd;
    }
    public String getVerCode() {
        return verCode;
    }

    public void setVerCode(String verCode) {
        this.verCode = verCode;
    }
}
