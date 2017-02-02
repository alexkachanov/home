package com.kachanov.list;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.catalina.ContainerServlet;
import org.apache.catalina.Host;
import org.apache.catalina.Wrapper;

public class ListServlet extends HttpServlet implements ContainerServlet {

	private static final long serialVersionUID = -3274516409859454951L;

	private Wrapper wrapper = null;
	private Host host = null; 
	
	@Override
	public void init() throws ServletException {
		System.out.println("init(): " + host.getClass().getSimpleName());
		getServletContext().setAttribute("host", host);
	}

	@Override
	public Wrapper getWrapper() {
		return wrapper;
	}

	@Override
	public void setWrapper(Wrapper wrapper) {
		this.wrapper = wrapper;
		host = (Host) wrapper.getParent().getParent();
		System.out.println("setWrapper: " + host.getClass().getSimpleName());
		
	}

}
