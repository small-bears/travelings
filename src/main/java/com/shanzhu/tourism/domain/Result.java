package com.shanzhu.tourism.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.shanzhu.tourism.enums.ResultCode;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 统一返回类型
 *
 * 
 * @date: 2024-08-10
 */
@Slf4j
@Data
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Result {

    private boolean success;
    private String message;
    private Integer code;
    private Object data;

    public Result(ResultCode code) {
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = code.getMessage();
    }

    public static Result success() {
        return new Result(ResultCode.COMMON_SUCCESS);
    }

    public static Result success(Object data) {
        return new Result(ResultCode.COMMON_SUCCESS, data);
    }

    public static Result success(String msg) {
        return new Result(ResultCode.COMMON_SUCCESS, msg);
    }

    public static Result alert(ResultCode code) {
        return new Result(code);
    }

    public static Result alert(ResultCode code, String message) {
        return new Result(code, message);
    }

    public static Result alert(ResultCode code, Exception e) {
        log.error(e.getMessage(), e);
        return new Result(code);
    }

    public static Result alert(Integer code, String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }


    public static Result fail() {
        return new Result(ResultCode.COMMON_FAIL);
    }

    public static Result fail(String msg) {
        return new Result(ResultCode.COMMON_FAIL, msg);
    }

    public static Result fail(String msg, Exception e) {
        log.error(e.getMessage(), e);
        return new Result(ResultCode.COMMON_FAIL, msg);
    }


    /**
     * 统一返回码，信息自定义
     *
     * @param code
     * @param message
     */
    public Result(ResultCode code, String message) {
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = message;
    }

    public Result(ResultCode code, Object object) {
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = code.getMessage();
        this.data = object;
    }

}
