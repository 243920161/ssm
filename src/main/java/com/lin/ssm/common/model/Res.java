package com.lin.ssm.common.model;

/**
 * 响应对象
 * @author 林 
 */
public class Res {
	/**
	 * 返回码
	 */
	private Integer code;

	/**
	 * 返回消息
	 */
	private String msg;

	/**
	 * 返回数据
	 */
	private Object data;

	private Res(Integer code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public static Res ok() {
		return new Res(200, null, null);
	}

	public static Res ok(String msg) {
		return new Res(200, msg, null);
	}

	public static Res ok(String msg, Object data) {
		return new Res(200, msg, data);
	}

	public static Res ok(Object data) {
		return new Res(200, null, data);
	}

	public static Res error(String msg) {
		return new Res(500, msg, null);
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
