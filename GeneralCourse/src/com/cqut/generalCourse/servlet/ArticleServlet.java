package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.entity.Users;
import com.cqut.generalCourse.service.ArticleService;
import com.google.gson.Gson;

public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ArticleService articleService = new ArticleService();
	Gson gson = new Gson();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// TODO Auto-generated method stub
				Map<String, String[]> params = request.getParameterMap();
				String method = params.get("method")[0];
				List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
				switch(method){
					case "getArticleById":
						Long articleId = Long.parseLong(params.get("articleId")[0]);
						result = articleService.getArticleById(articleId);
						break;
					case "getArticlesByParams":
						String selectParamsStr = params.get("params")[0];
						Map selectParams = gson.fromJson(selectParamsStr, Map.class);
						selectParams.put("currentUserId", Long.parseLong(request.getSession().getAttribute("userId").toString()));
						result = articleService.getArticlesByParams(selectParams);
						break;
					case "articleAdd":
						String columnAdd = params.get("article")[0];
						Map addArticle = gson.fromJson(columnAdd, Map.class);
						addArticle.put("userId", Long.parseLong(request.getSession().getAttribute("userId").toString()));
						result = articleService.addArticle(addArticle);
						break;
					case "deleteArticleById":
						Long id = Long.parseLong(params.get("id")[0]);
						result = articleService.deleteArticleById(id);
						break;
					case "articleEdit":
						String articleEdit = params.get("article")[0];
						Map editArticle = gson.fromJson(articleEdit, Map.class);
						result = articleService.editArticle(editArticle);
						break;
					case "getPublishArticlesByColumnId":
						String columnId = params.get("id")[0];
						result = articleService.getPublishArticlesByColumnId(columnId);
						break;
					case "review":
						articleId = Long.parseLong(params.get("id")[0]);
						String status = params.get("status")[0];
						result = articleService.review(articleId,status);
						break;
				}
				 
				String json = gson.toJson(result);
				
				System.out.println(json);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();  
		        out.write(json);  
	}
}
