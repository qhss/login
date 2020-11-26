package com.example.demo.utils;

import java.util.Map;

import static java.util.Objects.isNull;
import static org.apache.commons.lang3.ObjectUtils.isEmpty;

/**
 * 字符串工具类
 * @author Tater
 * @date Sep 1, 2018
 */
public class StringUtils {

	/**
	 * 判空操作
	 * @param value
	 * @return
	 */
	public static boolean isBlank(String value) {
		return value == null || "".equals(value) || "null".equals(value) || "undefined".equals(value);
	}



	/**
	 * * 判断一个字符串是否为非空串
	 *
	 * @param str String
	 * @return true：非空串 false：空串
	 */
	public static boolean isNotEmpty(String str)
	{
		return !isEmpty(str);
	}

	/**
	 * * 判断一个对象是否为空
	 *
	 * @param object Object
	 * @return true：为空 false：非空
	 */
	public static boolean isNull(Object object)
	{
		return object == null;
	}

	/**
	 * * 判断一个对象是否非空
	 *
	 * @param object Object
	 * @return true：非空 false：空
	 */
	public static boolean isNotNull(Object object)
	{
		return !isNull(object);
	}

}
