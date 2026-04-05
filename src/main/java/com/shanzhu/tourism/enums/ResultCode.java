package com.shanzhu.tourism.enums;


/**
 * 返回枚举
 *
 * 
 * @date: 2023-11-10
 */
public enum ResultCode {

    //通用操作返回码
    COMMON_SUCCESS(true,1000,"操作成功!"),
    COMMON_FAIL(false,1001,"操作失败！"),
    COMMON_NO_LOGIN(false,1002,"未登录!"),
    COMMON_SERVER_ERROR(false,1004,"系统繁忙，请稍后重试！"),
    COMMON_DATA_OPTION_ERROR(false,1005,"数据操作异常！"),
    COMMON_NO_TOKEN(false,1006,"TOKEN为空!"),
    COMMON_TOKEN_ILLEGAL(false,1007,"TOKEN非法!"),
    COMMON_USER_NOT_EXIST(false,1008,"用户不存在!"),
    COMMON_ACCOUNT_LOCKED(false,1009,"该账号已被锁定!"),
    COMMON_PASSWORD_RESET(false,1010,"密码已过期！"),
    COMMON_TOKEN_FAILURE(false,1011,"令牌已失效!"),
    COMMON_REQUEST_CSRF(false,1020,"帐号登录状态变更，请刷新浏览器后重新操作。"),
    COMMON_FAIL_VALIDATE(false,1050,"参数校验失败！");

    private boolean success;
    private Integer code;
    private String message;

    ResultCode(boolean success, Integer code, String message) {
        this.success = success;
        this.code = code;
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

}
