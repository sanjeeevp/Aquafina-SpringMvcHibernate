package com.aquafina.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.aquafina.spring.dao.BookDAO;
import com.aquafina.spring.model.Book;

public class BookServiceImpl implements BookService
{

	private BookDAO BookDAO;

	public void setBookDAO(BookDAO BookDAO) {
		this.BookDAO = BookDAO;
	}

	@Override
	@Transactional
	public void addBook(Book b) {
		this.BookDAO.addBook(b);
	}

	@Override
	@Transactional
	public void updateBook(Book b) {
		this.BookDAO.updateBook(b);
	}

	@Override
	@Transactional
	public List<Book> listBooks() {
		return this.BookDAO.listBooks();
	}

	@Override
	@Transactional
	public Book getBookById(int id) {
		return this.BookDAO.getBookById(id);
	}

	@Override
	@Transactional
	public void removeBook(int id) {
		this.BookDAO.removeBook(id);
	}

}
