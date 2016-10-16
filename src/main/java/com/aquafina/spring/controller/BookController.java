package com.aquafina.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aquafina.spring.model.Book;
import com.aquafina.spring.service.BookService;

@Controller
public class BookController {

	private BookService bookService;

	@Autowired(required = true)
	@Qualifier(value = "bookService")
	public void setBookService(BookService bs) {
		this.bookService = bs;
	}

	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String listBooks(Model model) {
		model.addAttribute("book", new Book());
		model.addAttribute("listBooks", this.bookService.listBooks());
		return "book";
	}

	// For add and update book both
	@RequestMapping(value = "/book/add", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book b) {

		if (b.getId() == 0) {
			// new book, add it
			this.bookService.addBook(b);
		} else {
			// existing book, call update
			this.bookService.updateBook(b);
		}

		return "redirect:/bookList";
	}

	//
	@RequestMapping(value = "/book/addd", method = RequestMethod.POST)
	public String adddBook(@RequestParam CommonsMultipartFile fileUpload,
			@ModelAttribute("book") Book b) {

		if (b.getId() == 0) {
			// new book, add it
			b.setBookImage(fileUpload.getBytes());
			this.bookService.addBook(b);
		} else {
			// existing book, call update
			b.setBookImage(fileUpload.getBytes());
			this.bookService.updateBook(b);
		}

		return "redirect:/bookList";

	}

	//
	@RequestMapping(value = "/view/image", method = RequestMethod.GET)
	public void showImage(@RequestParam("id") Integer id,
			HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {

		Book b = bookService.getBookById(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(b.getBookImage());

		response.getOutputStream().close();
	}

	//

	@RequestMapping("/book/remove/{id}")
	public String removeBook(@PathVariable("id") int id) {

		this.bookService.removeBook(id);
		return "redirect:/books";
	}

	@RequestMapping("/book/edit/{id}")
	public String editBook(@PathVariable("id") int id, Model model) {
		model.addAttribute("book", this.bookService.getBookById(id));
		model.addAttribute("listBooks", this.bookService.listBooks());
		return "book";
	}

	@RequestMapping("/book/view/{id}")
	public String viewBook(@PathVariable("id") int id, Model model) {
		model.addAttribute("book", this.bookService.getBookById(id));
		return "bookdetails";
	}

	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public String listBooks2(Model model) {
		model.addAttribute("book", new Book());
		model.addAttribute("listBooks", this.bookService.listBooks());
		return "bookList";
	}

	//
	@RequestMapping("/book/view/all")
	public String viewAllBook(Model model) {
		model.addAttribute("book", new Book());
		List<Book> bookList = new ArrayList<Book>();
		bookList = this.bookService.listBooks();

		Collections.sort(bookList, new Comparator<Book>() {
			@Override
			public int compare(Book b1, Book b2) {
				return b2.getBookDate().compareTo(b1.getBookDate());
			}
		});
		model.addAttribute("listBooks", bookList);
		return "allbookdetails";
	}

	@RequestMapping(value = "/searchBook", method = RequestMethod.GET)
	public String searchPage(Model model) {
		return "search";
	}

	@RequestMapping(value = "/doSearch")
	public String searchBooks(@RequestParam("searchText") String searchText, Model model) {
		model.addAttribute("book", new Book());
		model.addAttribute("foundBooks", this.bookService.searchByBooks(searchText));
		return "searchResult";
	}

}
