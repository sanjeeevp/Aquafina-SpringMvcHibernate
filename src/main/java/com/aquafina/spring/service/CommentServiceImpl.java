package com.aquafina.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.aquafina.spring.dao.CommentDAO;
import com.aquafina.spring.model.Comment;

public class CommentServiceImpl implements CommentService {

	private CommentDAO CommentDAO;

	public void setCommentDAO(CommentDAO CommentDAO) {
		this.CommentDAO = CommentDAO;
	}

	@Override
	@Transactional
	public void addComment(Comment c) {
		this.CommentDAO.addComment(c);
	}

	@Override
	@Transactional
	public void updateComment(Comment c) {
		this.CommentDAO.updateComment(c);
	}

	@Override
	@Transactional
	public List<Comment> listComments() {
		return this.CommentDAO.listComments();
	}

	@Override
	@Transactional
	public Comment getCommentById(int id) {
		return this.CommentDAO.getCommentById(id);
	}

	@Override
	@Transactional
	public void removeComment(int id) {
		this.CommentDAO.removeComment(id);
	}

}
