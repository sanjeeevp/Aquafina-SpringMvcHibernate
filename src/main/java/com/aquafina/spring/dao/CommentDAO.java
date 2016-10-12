package com.aquafina.spring.dao;

import java.util.List;

import com.aquafina.spring.model.Comment;

public interface CommentDAO {

	public void addComment(Comment c);
	public void updateComment(Comment c);
	public List<Comment> listComments();
	public Comment getCommentById(int id);
	public void removeComment(int id);
	
}
