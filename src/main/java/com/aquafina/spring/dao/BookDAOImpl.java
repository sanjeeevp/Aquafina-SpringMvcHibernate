package com.aquafina.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aquafina.spring.model.Book;

@SuppressWarnings("unchecked")
public class BookDAOImpl implements BookDAO {

	private static final Logger logger = LoggerFactory
			.getLogger(BookDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addBook(Book b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(b);
		logger.info("Book saved successfully, Book Details=" + b);
	}

	@Override
	public void updateBook(Book b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(b);
		logger.info("Book updated successfully, Book Details=" + b);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> listBooks() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Book> BooksList = session.createQuery("from Book").list();
		for (Book b : BooksList) {
			logger.info("Book List::" + b);
		}
		return BooksList;
	}

	@Override
	public Book getBookById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Book b = (Book) session.load(Book.class, new Integer(id));
		logger.info("Book loaded successfully, Book details=" + b);
		return b;
	}

	@Override
	public void removeBook(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Book b = (Book) session.load(Book.class, new Integer(id));
		if (null != b) {
			session.delete(b);
		}
		logger.info("Book deleted successfully, Book details=" + b);
	}

	@Override
	public List<Book> searchForBook(String searchText) {

		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Book.class);
		Criterion bookname = Restrictions.ilike("bookName", "%"+ searchText +"%", MatchMode.ANYWHERE);
		Criterion bookauthor = Restrictions.ilike("bookAuthor",  "%"+ searchText +"%", MatchMode.ANYWHERE);
		Criterion bookcontent = Restrictions.ilike("content",  "%"+ searchText +"%", MatchMode.ANYWHERE);
		
		Disjunction orExp = Restrictions.or(bookname, bookauthor, bookcontent);
		crit.add(orExp);
		List<Book> results=crit.list();
		return results;
	}
}
