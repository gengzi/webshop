package cn.edu.aynu.sushe.utils;

import java.util.Map;
import java.util.UUID;

import javax.management.RuntimeErrorException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

/**
 * 提供UUID，实现表单数据封装到bean中
 * @author Administrator
 *
 */
public class CommonsUtils {
	/**
	 * 返回一个UUID
	 * @return
	 */
	public static String uuid(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
		
	}
	
	/**
	 * 把表单数据封装到bean中
	 */
	public static <T> T toBean(Map data, Class<T> clazz){
		try{
			T bean = clazz.newInstance();
			//注册日期类型器
			ConvertUtils.register(new DateConverter(), java.util.Date.class);
			BeanUtils.populate(bean, data);
			return bean;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
}
