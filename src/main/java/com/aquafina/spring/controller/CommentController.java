package com.aquafina.spring.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

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

import com.aquafina.spring.model.Comment;
import com.aquafina.spring.service.CommentService;

@Controller
public class CommentController {

	private CommentService commentService;

	@Autowired(required = true)
	@Qualifier(value = "commentService")
	public void setCommentService(CommentService cs) {
		this.commentService = cs;
	}

	@RequestMapping(value = "/comments", method = RequestMethod.GET)
	public String listComments(Model model) {
		model.addAttribute("comment", new Comment());
		model.addAttribute("listComments", this.commentService.listComments());
		return "comment";
	}

	// For add and update comment both
	@RequestMapping(value = "/comment/add", method = RequestMethod.POST)
	public String addComment(@ModelAttribute("comment") Comment c) {

		if (c.getId() == 0) {
			// new comment, add it
			this.commentService.addComment(c);
		} else {
			// existing comment, call update
			this.commentService.updateComment(c);
		}
		return "redirect:/commentList";
	}

	//
	@RequestMapping(value = "/comment/addd", method = RequestMethod.POST)
	public String adddComment(@RequestParam CommonsMultipartFile fileUpload,
			@ModelAttribute("comment") Comment c) {

		if (c.getId() == 0) {
			// new comment, add it
			this.commentService.addComment(c);
		} else {
			// existing comment, call update
			this.commentService.updateComment(c);
		}
		return "redirect:/commentList";
	}

	@RequestMapping("/comment/remove/{id}")
	public String removeComment(@PathVariable("id") int id) {

		this.commentService.removeComment(id);
		return "redirect:/comments";
	}

	@RequestMapping("/comment/edit/{id}")
	public String editComment(@PathVariable("id") int id, Model model) {
		model.addAttribute("comment", this.commentService.getCommentById(id));
		model.addAttribute("listComments", this.commentService.listComments());
		return "comment";
	}

	@RequestMapping("/comment/view/{id}")
	public String viewComment(@PathVariable("id") int id, Model model) {
		model.addAttribute("comment", this.commentService.getCommentById(id));
		return "commentdetails";
	}

	@RequestMapping(value = "/commentList", method = RequestMethod.GET)
	public String listComments2(Model model) {
		model.addAttribute("comment", new Comment());
		model.addAttribute("listComments", this.commentService.listComments());
		return "commentList";
	}

	@RequestMapping("/comment/view/all")
	public String viewAllComment(Model model) {
		model.addAttribute("comment", new Comment());
		List<Comment> commentList = new ArrayList<Comment>();
		commentList = this.commentService.listComments();
		
		Collections.sort(commentList, new Comparator<Comment>() {
			@Override
			public int compare(Comment b1, Comment b2) {
				return b2.getCommentDate().compareTo(b1.getCommentDate());
			}
		});
		model.addAttribute("listComments", commentList);

		return "allcommentdetails";
	}

}
