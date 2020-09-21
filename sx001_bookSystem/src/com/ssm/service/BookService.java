package com.ssm.service;

import java.util.List;

import com.ssm.entity.Book;

public interface BookService {
	
	List<Book> getBookList(String name,String author);
	
	int deleteBookById(Integer id);
	
	int addBook(Book bk);
	
	Book selectById(Integer id);
	
	int updateBook(Book bk);
	
	int delMany(List<Integer> ids); //批量删去 

}
