package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.BookMapper;
import com.ssm.entity.Book;
import com.ssm.service.BookService;


@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bkMapper;
	
	@Override
	public List<Book> getBookList(String name,String author) {
		return bkMapper.getBookList(name, author);
	}

	@Transactional
	public int deleteBookById(Integer id) {
		return bkMapper.deleteBookById(id);
	}

	@Transactional
	public int addBook(Book bk) {
		return bkMapper.addBook(bk);
	}

	@Override
	public Book selectById(Integer id) {
		return bkMapper.selectById(id);
	}

	@Transactional
	public int updateBook(Book bk) {
		return bkMapper.updateBook(bk);
	}

	@Transactional
	public int delMany(List<Integer> ids) {
		int num=0; //计数
		for (Integer id : ids) { //循环遍历控制层传过来的id
			if(bkMapper.deleteBookById(id)>0){
				 num++;
			}
		}
		if(num!=ids.size())
		   return 0;
		else
		  return 1;
	    }
}
