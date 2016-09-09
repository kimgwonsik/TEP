package main;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import util.TepConstants;

public class MainAction implements SessionAware{
	private Map session;

	public String execute() throws Exception {
		session.put(TepConstants.SAVEURI, "main.action");
		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
