package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//该过滤器用于 在未登录时拦截所有访问，禁止访问页面。
//@WebFilter(urlPatterns= {"/adminList","/goodsGetAllByPageFuzzy","/goodsTypeGetAll","/userListSevlet",
//						 			  "/goodsSaveOrUpdate","/goodTypeaddOrUpdate",
//						 "/add_admin.jsp","/add_goods_type.jsp","/add_goods_type.jsp"})//在数组中写入拦截的页面

public class MyFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req= (HttpServletRequest) request;
		HttpServletResponse rep=(HttpServletResponse) response;
		Object user=req.getSession().getAttribute("user");
		Object admin=req.getSession().getAttribute("admin");
		String URI=req.getRequestURI();
		int lastIndex=URI.indexOf("/");
		String uri=URI.substring(lastIndex+1);
		//放行路径 注册、登录 及相关的servlet路径
		//System.out.println("user:"+user+" admin:"+admin);
		if(admin!=null || user!=null) {
			chain.doFilter(request, response);
		}else {
			rep.sendRedirect("/FM/after/userlogin.jsp");
		}
	}
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
