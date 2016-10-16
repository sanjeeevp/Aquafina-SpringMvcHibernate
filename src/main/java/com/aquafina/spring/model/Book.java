package com.aquafina.spring.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.search.annotations.*;

@Entity
@Table(name = "Book")
public class Book {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "book_name")
	@Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
	private String bookName;

	@Column(name = "content")
	@Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
	private String content;
	
	@Column(name = "book_author")
	@Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
	private String bookAuthor;

	@Column(name = "book_date")
	private Date bookDate = new Date();

	@Column(name = "book_image")
	private byte[] bookImage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public byte[] getBookImage() {
		return bookImage;
	}

	public void setBookImage(byte[] bookImage) {
		this.bookImage = bookImage;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", bookName=" + bookName + ", content="
				+ content + ", bookAuthor=" + bookAuthor + ", bookDate="
				+ bookDate + "]";
	}
}
