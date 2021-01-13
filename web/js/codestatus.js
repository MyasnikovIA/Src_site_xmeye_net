/**
 * Created by Administrator on 2016-07-12.
 */
function codestatus(code){
    var message;
    if(code==2000){
        message="<span class='ok'>成功</span>";
    }else if(code==4000){
        message="用户名或密码错误"
    }else if(code==4010){
        message="验证码错误"
    }else if(code==4011){
        message="密码不一致"
    }else if(code==4012){
        message="用户名已被注册"
    }else if(code==4013){
        message="用户名为空"
    }else if(code==4014){
        message="密码为空"
    }else if(code==4015){
        message="确认密码为空"
    }else if(code==4016){
        message="手机号为空"
    }else if(code==4017){
        message="用户名格式不正确"
    }else if(code==4018){
        message="密码格式不正确"
    }else if(code==4019){
        message="确认密码格式不正确"
    }else if(code==4020){
        message="手机号格式不正确"
    }else if(code==4021){
        message="手机号已存在"
    }else if(code==4022){
        message="手机号不存在"
    }else if(code==4023){
        message="邮箱已存在"
    }else if(code==4024){
        message="邮箱不存在"
    }else if(code==4025){
        message="用户名不存在"
    }else if(code==4026){
        message="原密码错误"
    }else if(code==4027){
        message="修改密码失败"
    }else if(code==4029){
        message="用户ID为空"
    }else if(code==4030){
        message="验证码为空"
    }else if(code==4031){
        message="邮箱为空"
    }else if(code==4032){
        message="邮箱格式不正确"
    }else if(code==4100){
        message="设备非法不允许添加"
    }else if(code==4101){
        message="设备已存在"
    }else if(code==4103){
        message="修改失败"
    }else if(code==4104){
        message="设备uuid参数异常"
    }else if(code==4105){
        message="设备用户名参数异常"
    }else if(code==4106){
        message="设备密码参数异常"
    }else if(code==4300){
        message="发送失败"
    }else if(code==4400){
        message="短信接口验证失败，请联系我们"
    }else if(code==4401){
        message="短信接口参数错误，请联系我们"
    }else if(code==4402){
        message="每个手机号一天只能发送三次短信"
    }else if(code==4403){
        message="发送失败，请稍后再试"
    }else if(code==4404){
        message="发送太频繁了，请间隔120秒"
    }else if(code==5000){
        message="服务器故障"
    }else if(code==5001){
        message="证书不存在"
    }else if(code==5005){
        message="格式异常";
    }else{
        message=code;
    }
    return message;
}