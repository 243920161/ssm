package com.lin.ssm.common.controller;

import com.lin.ssm.common.model.BizException;
import com.lin.ssm.common.model.Res;
import org.apache.log4j.Logger;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理
 * @author 林
 */
@RestControllerAdvice
public class ExceptionController {
    /**
     * 日志输出
     */
    private Logger log = Logger.getLogger(ExceptionController.class);

    /**
     * 400异常
     * @param e 异常信息
     * @return 响应对象
     */
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public Res httpMessageNotReadableException(HttpMessageNotReadableException e) {
        log.error("参数解析失败", e);
        return Res.error("参数解析失败" + e.getMessage());
    }

    /**
     * 405异常
     * @param e 异常信息
     * @return 响应对象
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public Res httpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        log.error("不支持当前请求方法", e);
        return Res.error("不支持当前请求方法" + e.getMessage());
    }

    /**
     * 415异常
     * @param e 异常信息
     * @return 响应对象
     */
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public Res httpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException e) {
        log.error("不支持当前媒体类型", e);
        return Res.error("不支持当前媒体类型" + e.getMessage());
    }

    /**
     * 自定义业务异常
     * @param e 异常信息
     * @return 响应对象
     */
    @ExceptionHandler(BizException.class)
    public Res bizException(BizException e) {
        log.error(e.getMessage(), e);
        return Res.error(e.getMessage());
    }

    /**
     * Exception异常
     * @param e 异常信息
     * @return 响应对象
     */
    @ExceptionHandler(Exception.class)
    public Res exception(Exception e) {
        log.error(e.getMessage(), e);
        return Res.error(e.getMessage());
    }
}
