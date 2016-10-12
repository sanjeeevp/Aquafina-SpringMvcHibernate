package com.aquafina.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aquafina.spring.model.Comment;

public class CommentDAOImpl implements CommentDAO{

	private static final Logger logger = LoggerFactory.getLogger(CommentDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addComment(Comment c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(c);
		logger.info("Comment saved successfully, Comment Details="+c);
	}

	@Override
	public void updateComment(Comment c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(c);
		logger.info("Comment updated successfully, Comment Details="+c);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> listComments() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Comment> CommentsList = session.createQuery("from Comment").list();
		for(Comment c : CommentsList){
			logger.info("Comment List::"+c);
		}
		return CommentsList;
	}

	@Override
	public Comment getCommentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Comment c = (Comment) session.load(Comment.class, new Integer(id));
		logger.info("Comment loaded successfully, Comment details="+c);
		return c;
	}

	@Override
	public void removeComment(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Comment c = (Comment) session.load(Comment.class, new Integer(id));
		if(null != c){
			session.delete(c);
		}
		logger.info("Comment deleted successfully, Comment details="+c);
	}

}