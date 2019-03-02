package cn.edu.aynu.sushe.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 生产验证码图片
 * @author rjxy
 *
 */
public class CheckServlet extends HttpServlet {

	private static int WIDTH = 60;
	private static int HEIGHT = 20;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("image/jpeg"); //内容为图片
		ServletOutputStream sos = response.getOutputStream();
		//设置浏览器不要缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-control", "no-cache");
		response.setDateHeader("Expires", 0);
		//创建内存图像(空)
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		//得到图像的上下文
		Graphics g = image.getGraphics();
		//产生随机验证码
		char[] rands = generateCheckCode();
		//产生图片背景
		drawBackGround(g);
		//将4位验证码写到图片上
		drawRands(g, rands);
		//完成图像
		g.dispose();
		//将图像输出到客户端
		ByteArrayOutputStream bos  = new ByteArrayOutputStream();
		ImageIO.write(image, "JPEG", bos);
		byte[] buf = bos.toByteArray();
		response.setContentLength(buf.length);//设置输出图片的大小
		sos.write(buf); //把图片输出到客户端
		bos.close();
		sos.close();
		//将验证码保存在session中，目的是和用户输入的进行比较
		session.setAttribute("check_code", new String(rands));
	}

	//生产4位随机字符的验证码
	private char[] generateCheckCode(){
		//定义一个字符表(36个字符)
		String chars = "0123456789abcdefghijklmnopqrstuvwxyz";
		char[] rands = new char[4];
		for(int i=0; i<4;i++){
			int rand =(int)(Math.random()*36);//随机生产一个0-35之间的正整数
			rands[i] = chars.charAt(rand);
		}
		return rands;
	}

	//画出图片的背景（干扰识别）
	private void drawBackGround(Graphics g){
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		//随机产生120个干扰点
		for(int i=0;i<120;i++){
			int x = (int)(Math.random()*WIDTH);
			int y = (int)(Math.random()*HEIGHT);
			int red = (int)(Math.random()*255);
			int green = (int)(Math.random()*255);
			int blue = (int)(Math.random()*255);
			g.setColor(new Color(red, green, blue));
			g.drawOval(x, y, 1, 0);
		}
	}
	
	//将4位验证码写到图片上
	private void drawRands(Graphics g,char[] rands){
		g.setColor(Color.black);
		g.setFont(new Font(null,Font.ITALIC|Font.BOLD,18));
		//在不同的位置输出验证码字符
		g.drawString(""+rands[0], 1, 17);
		g.drawString(""+rands[1], 16, 15);
		g.drawString(""+rands[2], 31, 18);
		g.drawString(""+rands[3], 46, 16);
	}
	
}
