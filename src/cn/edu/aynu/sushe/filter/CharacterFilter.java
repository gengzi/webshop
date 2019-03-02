package cn.edu.aynu.sushe.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
/**
 * �ַ������������������
 * @author Administrator
 *
 */
public class CharacterFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		//��������������
		//post����
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		/*
		 * ��request���а�װ
		 * characterRequest������ǿ�ˣ���ȡ���Ĳ���ֱ�Ӵ�������
		 */
		CharacterRequest characterRequest = new CharacterRequest(request);
		//����
		chain.doFilter(characterRequest, response);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}

//��request�������°�װ����ǿ�Ĺ��ܣ�����get������������룩
class CharacterRequest extends HttpServletRequestWrapper{

	public CharacterRequest(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}
	
	/*
	 * ��дgetParameter(),��ǿ�Ĺ��ܣ�����get�������������
	 */
	public String getParameter(String name){
		//���ñ���װ�������еķ�������ȡ�������
		String value = super.getParameter(name);
		if(value == null){
			return null;
		}
		//�ж�����ʽ
		String method = super.getMethod();
		//�����get����
		if("get".equalsIgnoreCase(method)){
			try {
				value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return value;
		
	}
	
}

