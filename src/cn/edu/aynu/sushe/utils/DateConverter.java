package cn.edu.aynu.sushe.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.commons.beanutils.Converter;

public class DateConverter implements Converter {
	/**
	 * 将日期字符串转换为Date
	 * value是字符串
	 * type为Date.class
	 */
	public Object convert(Class type, Object value) {
		if(type != java.util.Date.class){
			return null;
		}
		if(!(value instanceof String)){
			return null;
		}
		String s = (String)value;
		//将字符串转换为date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(s);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

}
