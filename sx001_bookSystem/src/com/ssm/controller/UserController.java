package com.ssm.controller;

import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.User;
import com.ssm.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	//去登录页面
	@RequestMapping("/toLogin.do")
	public String toLoginPage(){
		return "login"; //去登录页面-逻辑视图名
	}
	
	//登录
	@RequestMapping("/doLogin.do")
	public ModelAndView login(String name,String password,HttpServletRequest req){
		//1、调用业务处理的登录方法
		User u1= uService.login(name, password);
		//2、根据返回结果进行判断处理
		if(u1!=null){
		  //3、成功-去图书列表页面;转发到图书列表页面控制层的url并且把用户信息带过去(booklist.jsp)
			req.getSession().setAttribute("user",u1); //把用户信息保存到session当中
			return new ModelAndView("redirect:booklist.do"); 
		}
	    //失败-去登录页面并且带消息提示
		return new ModelAndView("login","msg","用户名或密码错误！");
	}
	
	//去用户修改页面
	@RequestMapping("/toUserUpdatePage.do")
	public ModelAndView toUpdateUserPage(Integer id){
		//1、调用业务处理-根据id查询当前用户
		User u1=uService.selectById(id);
		//2、根据返回结果进行判断处理
		if(u1!=null){
			//去用户修改页面且把当前用户信息带过去
			return new ModelAndView("updateUser","u1",u1);
		}
		return null;
	}
	
	//真正的修改用户信息
	@RequestMapping("/updateUser.do")
	public ModelAndView updateUser(User user){
		//1、调用业务处理-调用业务层UserService的修改方法
		int num=uService.updateUser(user);
		//2、根据返回结果进行判断处理
		if(num>0){
			return new ModelAndView("redirect:booklist.do");
		}
		return null;
	}
	
	@RequestMapping("/downLoad.do")
	public void downLoadFile(String filename,HttpServletRequest req,HttpServletResponse res) throws Exception{
		//1、获得文件路径
		 String file=req.getServletContext().getRealPath("/imgs/"+filename);
		//2、通过文件路径构建一个输入流对象
		FileInputStream fis=new FileInputStream(file);
		//3、中文字符的处理
		//浏览器默认是以ISO-8859-1编码进行解析下载的
		filename=new String(filename.getBytes("UTF-8"),"ISO-8859-1");
		//4、设置输出相关信息
		res.setHeader("content-disposition","attchment;filename="+filename);//设置文档头
		res.setContentType("application/octet-stream");//设置内容类型
		res.setContentLength(fis.available());
		//5、构建缓冲区
		byte[] by=new byte[2048];//减少读写次数提升读写性能
		int len=0; //读取的长度
		//6、循环读写
		while((len=fis.read(by))!=-1){
			res.getOutputStream().write(by,0,len);//写操作
		}
		//7、刷新并关闭资源
		res.getOutputStream().flush(); //刷新
		res.getOutputStream().close(); //关闭资源
		fis.close();//关闭资源
	}
}
