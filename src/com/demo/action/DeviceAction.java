package com.demo.action;


import java.io.PrintWriter;

import com.demo.Po.DevicePo;
import com.demo.Po.UserPo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.xm.client.UserDevice;
import net.xm.client.bean.*;
import net.xm.client.bean.device.DeviceBean;

import net.xm.client.bean.device.DeviceCodeBean;
import net.xmcloud.component.URLUtil;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import static org.apache.struts2.ServletActionContext.*;


/**
 * Created by Administrator on 2016-07-08.
 */
@Controller("device")
@Scope("prototype")
public class DeviceAction extends ActionSupport {

    private String userId;   //用户唯一标识符
    private DeviceBean device;
    //    修改设备登录密码
    private String uuid;
    private String oldDevicePwd;
    private String newDevicePwd;
    private String webMac;

    private String deviceConfirmPassword;

    /**
     * 用户获取设备列表
     *
     * @throws Exception
     */
    public String list() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        DeviceVo vo = userDevice.listVo(userPo.getUserId(), userPo.getName(), userPo.getPassword());
        List<DeviceBean> list = vo.getData().getData();
        List<DevicePo> devicePoList = new ArrayList<>();
        for (DeviceBean bean : list) {
            DevicePo temp=new DevicePo();
            temp.setId(bean.getId());
            temp.setType(bean.getType());
            temp.setNickname(bean.getNickname());
            temp.setIp(bean.getIp());
            temp.setPort(bean.getPort());
            temp.setUuid(bean.getUuid());
            temp.setDevicename(bean.getUsername());
            temp.setUsername(URLUtil.encode(bean.getUsername()));
            temp.setPassword(URLUtil.encode(bean.getPassword()));
            devicePoList.add(temp);
        }
        getRequest().getSession().setAttribute("devicelist", devicePoList);

        return "success";
    }

    /**
     * 用户获取设备带授权码列表
     *
     * @throws Exception
     */
    public void listcode() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        DeviceListCodeVo vo = userDevice.listCodeVo(userPo.getName(), userPo.getPassword());
        List<DeviceCodeBean> list = vo.getData().getData();
        ActionContext.getContext().getSession().put("listsq", list);
    }

    /**
     * 用户设备添加
     *
     * @return
     */
    public void add() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        String ss = userDevice.add(device.getUuid(), device.getUsername(), device.getPassword(), device.getNickname(),
                userPo.getUserId(), userPo.getName(), userPo.getPassword());
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/xml;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        pw.print(ss);
        getRequest().getSession().removeAttribute("devicelist");
    }

    /**
     * 用户设备删除
     *
     * @return
     */
    public void delete() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        CommonVo vo = userDevice.rmVo(device.getUuid(), userPo.getUserId(), userPo.getName(), userPo.getPassword());
        getResponse().getWriter().print(vo.getCode());
        getRequest().getSession().removeAttribute("devicelist");
    }

    /**
     * 用户设备修改
     *
     * @return
     */
    public String update() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        DeviceEditVo vo = userDevice.editVo(device.getUuid(), device.getUsername(), device.getNickname(),
                userPo.getUserId(), userPo.getName(), userPo.getPassword());
        getResponse().getWriter().print(vo.getCode());
        getRequest().getSession().removeAttribute("devicelist");
        return "success";
    }

    /**
     * 用户修改设备登录密码
     *
     * @return
     */
    public void updatepwd() throws Exception {
        UserPo userPo = (UserPo) getRequest().getSession().getAttribute("user");
        UserDevice userDevice = UserDevice.newInstance();
        CommonVo vo = userDevice.editPassVo(uuid, oldDevicePwd, newDevicePwd, deviceConfirmPassword,
                userPo.getUserId(), userPo.getName(), userPo.getPassword());
        getResponse().getWriter().print(vo.getCode());
    }

    public void status(){
        String uuids=null;
        uuids=webMac.replace("**",";");
        UserDevice userDevice = UserDevice.newInstance();
        try {
            DeviceQueryStatusVo vo = userDevice.queryStatusVo(uuids);
            getResponse().getWriter().print(JSONArray.fromObject(vo.getData().toArray()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String offline(){
        return "success";
    }

    public String videoIfo() {
        return "success";
    }

    public String offLine() {
        return "success";
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public DeviceBean getDevice() {
        return device;
    }

    public void setDevice(DeviceBean device) {
        this.device = device;
    }

    public String getOldDevicePwd() {
        return oldDevicePwd;
    }

    public void setOldDevicePwd(String oldDevicePwd) {
        this.oldDevicePwd = oldDevicePwd;
    }

    public String getNewDevicePwd() {
        return newDevicePwd;
    }

    public void setNewDevicePwd(String newDevicePwd) {
        this.newDevicePwd = newDevicePwd;
    }

    public String getDeviceConfirmPassword() {
        return deviceConfirmPassword;
    }

    public void setDeviceConfirmPassword(String deviceConfirmPassword) {
        this.deviceConfirmPassword = deviceConfirmPassword;
    }

    public String getWebMac() {
        return webMac;
    }

    public void setWebMac(String webMac) {
        this.webMac = webMac;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
