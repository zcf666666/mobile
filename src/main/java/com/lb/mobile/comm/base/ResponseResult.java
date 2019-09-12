package com.lb.mobile.comm.base;

import org.springframework.beans.factory.annotation.Value;

import java.io.Serializable;

public class ResponseResult<T> implements Serializable {

    private final static String SUCCESS = "success";
    @Value("${server.url}")
    public  static String  fileUrl;
    public int code;

    private String msg;

    private T data;

    public ResponseResult<T> setCode(ResponseCode retCode) {
        this.code = retCode.code;
        return this;
    }
    public int getCode() {
        return code;
    }

    public ResponseResult<T> setCode(int code) {
        this.code = code;
        return this;
    }
    public ResponseResult<T> setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
        return this;
    }
    public String getFileUrl() {
        return fileUrl;
    }

    public String getMsg() {
        return msg;
    }
    public ResponseResult<T> setMsg(String msg) {
        this.msg = msg;
        return this;
    }
    public T getData() {
        return data;
    }
    public ResponseResult<T> setData(T data) {
        this.data = data;
        return this;
    }
    public static <T> ResponseResult<T> success() {
        return new ResponseResult<T>().setCode(ResponseCode.SUCCESS).setMsg(SUCCESS);
    }
    public static <T> ResponseResult<T> success(T data) {
        return new ResponseResult<T>().setCode(ResponseCode.SUCCESS).setMsg(SUCCESS).setData(data);
    }
    public static <T> ResponseResult<T> success(int code ,String msg ,T data) {
        return new ResponseResult<T>().setCode(code).setMsg(msg).setData(data);
    }
    public static <T> ResponseResult<T> success(int code ,String msg ,T data,String fileUrl) {
        return new ResponseResult<T>().setCode(code).setMsg(msg).setData(data).setFileUrl(fileUrl);
    }
    public static <T> ResponseResult<T> success(T data,String fileUrl) {
        return new ResponseResult<T>().setCode(ResponseCode.SUCCESS).setMsg(SUCCESS).setData(data).setFileUrl(fileUrl);
    }
    public static <T> ResponseResult<T> err(String message) {
        return new ResponseResult<T>().setCode(ResponseCode.FAIL).setMsg(message);
    }
    public static <T> ResponseResult<T> err(int code, String msg) {
        return new ResponseResult<T>().setCode(code).setMsg(msg);
    }
    public static <T> ResponseResult<T> err(int code, String msg, T data) {
        return new ResponseResult<T>().setCode(code).setMsg(msg).setData(data);
    }
    public static <T> ResponseResult<T> err(int code, String msg, T data,String fileUrl) {
        return new ResponseResult<T>().setCode(code).setMsg(msg).setData(data).setFileUrl(fileUrl);
    }
}
