package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Book;
import com.ssm.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService bkService;
	
   //查询图书列表页面
	@RequestMapping("/booklist.do")
	public  ModelAndView getBookList(
			@RequestParam(name="name",required=true,defaultValue="")String name,
			@RequestParam(name="author",required=true,defaultValue="")String author,
			@RequestParam(name="pno",required=true,defaultValue="1")Integer pno){
		ModelAndView mv=new ModelAndView();
		PageHelper.startPage(pno,3); //开始分页 
		PageHelper.orderBy("id desc");
		//1、调用业务处理
		List<Book> bkList = bkService.getBookList(name, author);
		PageInfo<Book> page=new PageInfo<Book>(bkList); //分好页的数据
		//2、根据业务处理来处理数据
		if(bkList!=null){
			//3、列表数据的展示-去图书列表页面并且带数据过去
			/*return new ModelAndView("booklist","bklist",bkList);*/
			mv.addObject("name",name);
			mv.addObject("author",author);
			mv.addObject("pno",pno);
			mv.addObject("bklist",bkList);
			mv.addObject("page",page);
			mv.setViewName("booklist");
			return mv;
		}
		return null;
	}
	
	//根据id删去图书
	@RequestMapping("/deleteBook.do")
	public ModelAndView deleteBook(Integer id){
		//1、调用业务处理
		int num=bkService.deleteBookById(id);
		//2、根据业务处理来处理数据
		if(num>0){//删去成功-去图书列表页面-重定向到列表展示页面的url
			return new ModelAndView("redirect:booklist.do");
		}
		//删除失败
		return null;
	}
	
	//去增加图书页面 
	@RequestMapping("/toAdd.do")
	public String toAddPage(){
		return "addbook";
	}
	
   //增加图书
	@RequestMapping("/addBook.do")
	public ModelAndView addBook(Book bk){
		//1、调用业务处理
		int num=bkService.addBook(bk);
		//2、根据业务处理来处理数据
		if(num>0){//增加成功-去图书列表页面-重定向到列表展示页面的url
			return new ModelAndView("redirect:booklist.do");
		}
		return null;
	}
	
	//去修改页面 并且带数据到页面 
	@RequestMapping("/toUpdate.do")
	public ModelAndView selectBookById(Integer id){
		//1、调用业务处理
		Book bk = bkService.selectById(id);
		//2、根据业务处理来处理数据
		if(bk!=null){
			return new ModelAndView("updatebook","bk",bk);
		}
		return null;
	}
	
	//修改图书
	@RequestMapping("/updateBook.do")
	public ModelAndView updateBook(Book bk){
		//1、调用业务处理
		int num=bkService.updateBook(bk);
		//2、根据业务处理来处理数据
		if(num>0){//修改成功-去图书列表页面-重定向到列表展示页面的url
			return new ModelAndView("redirect:booklist.do");
		}
		return null;
		
	}
	
	
	//批量删去图书
	@RequestMapping("/delMany.do")
	public ModelAndView deleteMany(String ids){
		List<Integer> ilist = new ArrayList<Integer>(); //声明一个集合 装载传过来的学生编号
		String[] nos=ids.split(","); //用逗号进行切割 1 2 3 4
		for (String id : nos) {
			ilist.add(Integer.parseInt(id)); //将传过来的学生编号添加到集合当中 
		}
		if(ilist!=null && ilist.size()>0){
			//1、调用业务处理
			int num=bkService.delMany(ilist);
			//2、根据业务处理来处理数据
			if(num>0){//修改成功-去图书列表页面-重定向到列表展示页面的url-forward转发
				return new ModelAndView("redirect:booklist.do");
			}
		}
		return null;
		
	}
}
