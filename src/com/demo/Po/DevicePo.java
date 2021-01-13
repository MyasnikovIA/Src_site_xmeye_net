package com.demo.Po;

import net.xm.client.bean.device.DeviceBean;

/**
 * Created by Administrator on 2016-08-04.
 */
public class DevicePo extends DeviceBean{
    public String getDevicename() {
        return devicename;
    }

    public void setDevicename(String devicename) {
        this.devicename = devicename;
    }

    private String devicename;
}
