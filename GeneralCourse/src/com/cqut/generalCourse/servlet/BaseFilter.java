package com.cqut.generalCourse.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Servlet Filter implementation class BaseFilter
 */
public class BaseFilter implements Filter {

    /**
     * Default constructor. 
     */
    public BaseFilter() {
        
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		System.out.println("RemoteAddr:"+httpRequest.getRequestURL());
		
		String requestURL = httpRequest.getRequestURL().toString();
		
		String loginPage = "/admin/login";
		
		//将js和css排除
		boolean isLogin = requestURL.contains("/admin/login") || 
				requestURL.contains("/admin/css")||requestURL.contains("admin/js");
		
		boolean isManagePage = requestURL.contains("/admin/");
		//System.out.println(isLogin+","+isManagePage);
		
		if(!isLogin && isManagePage){
//			Users operator = (Users) httpRequest.getSession().getAttribute("loginUser");
			HttpSession session = httpRequest.getSession();
			Object userName = session.getAttribute("username");
			Object password=session.getAttribute("password");
			if(userName==null || password==null){
				httpRequest.getServletContext().getRequestDispatcher("/admin/login.jsp").forward(httpRequest, response);
			}else{
				chain.doFilter(request, response);
			}
		}else{
			chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
