package cn.estore.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineCount implements ServletContextListener,HttpSessionListener{
	public void sessionCreated(HttpSessionEvent se) {
		// TODO session创建时启动
		HttpSession session=se.getSession();
		ServletContext context=session.getServletContext();
		//counter存放在线人数
		int counter=Integer.valueOf(context.getAttribute("counter").toString());
		counter=counter+1;
		context.setAttribute("counter", counter);
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO session销毁时启动
		HttpSession session=se.getSession();
		ServletContext context=session.getServletContext();
		//counter存放在线人数
		int counter=Integer.valueOf(context.getAttribute("counter").toString());
		counter=counter-1;//退出时在线人数减1
		context.setAttribute("counter", counter);
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		ServletContext context=arg0.getServletContext();
		context.removeAttribute("counter");
	}

	public void contextInitialized(ServletContextEvent arg0) {
		// TODO 应用程序初始化时启动
		ServletContext context=arg0.getServletContext();
		int counter=0;
		context.setAttribute("counter", counter);
	}
}
