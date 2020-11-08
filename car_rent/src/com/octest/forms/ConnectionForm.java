package com.octest.forms;

import javax.servlet.http.HttpServletRequest;

public class ConnectionForm {

	 
	public String resultat;
	public void verifierIdentifiants(HttpServletRequest request) {
		
		String login = request.getParameter("login");
		String pass = request.getParameter("pass");
		
		if(pass.equalsIgnoreCase(login)) {
			resultat="you are connected ! !";
		}else {resultat="id uncorrect !! "; }
	}
	
	
	public String getResutat() {
		return resultat;
	}

	public void setResutat(String resultat) {
		this.resultat = resultat;
	}
	
	
}
