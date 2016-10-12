package com.aquafina.spring.service;

import java.util.List;

import com.aquafina.spring.model.Book;
import com.aquafina.spring.model.Person;

public interface BookService {

	public void addBook(Book b);
	public void updateBook(Book b);
	public List<Book> listBooks();
	public Book getBookById(int id);
	public void removeBook(int id);
	
}
