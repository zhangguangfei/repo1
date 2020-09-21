package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ssm.entity.Book;

/**
 * Des: 图书数据层接口
 * @author sunwei
 */
public interface BookMapper {
	
	//查询所有
	List<Book> getBookList(@Param("name")String name,@Param("author")String author);
	
	@Delete("delete from book where id=#{id}")
	int deleteBookById(Integer id);
	
	int addBook(Book bk);
	
	@Select("select * from book where id=#{id}")
	Book selectById(Integer id);
	
	int updateBook(Book bk);

}
