package com.aquafina.spring.model;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "Comment")
public class Comment {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;

	@Column(name = "comment_text")
	private String commentText;

	@Column(name = "comment_date")
	private Date commentDate;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", commentText=" + commentText
				+ ", commentDate=" + commentDate + "]";
	}
}
