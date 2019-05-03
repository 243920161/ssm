package com.lin.ssm.common.model;

/**
 * 自定义业务异常
 * @author 林
 */
public class BizException extends Exception {
    public BizException(String message) {
        super(message);
    }
}
