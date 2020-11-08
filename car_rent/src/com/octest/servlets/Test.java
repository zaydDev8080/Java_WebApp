package com.octest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.octest.bdd.*;
import com.octest.beans.*;


/**
 * Servlet implementation class Test
 */
@WebServlet(name= "Test", urlPatterns = {"/Test","*.fr"})
public class Test extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static ArrayList l = new ArrayList();
       
    public Test() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // Noms tableNoms = new Noms();
       // request.setAttribute("utilisateurs", tableNoms.recupererUtilisateurs());
    	
    //	String idFrom = request.getParameter("test1");
    	
        
        //response.sendRedirect("/WEB-INF/carform.jsp");
    	
        
        System.out.println(">>>>>>  : : : : :"+request.getServletPath());
        if(request.getServletPath().contains("Test")) {
        	 this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request, response);
        	 
         }
        else if(request.getServletPath().contains("connect")) {
        	
        	 
        	 Utilisateur utilisateur = new Utilisateur();
             utilisateur.setNom(request.getParameter("nom"));
             utilisateur.setPrenom(request.getParameter("prenom"));
             Noms tableNoms = new Noms();
             int check= tableNoms.checkyuser(utilisateur);
             
             if(check ==1) {
          
             request.setAttribute("utilisateurs", tableNoms.recupererUtilisateurs());
             
             this.getServletContext().getRequestDispatcher("/WEB-INF/carform.jsp").forward(request, response);
             }
             else {
             	request.setAttribute("NotUser", check );
             		
             	this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request, response);
             }
        	 
             
        	 
         }
        else if(request.getServletPath().contains("carform") ) {
        	
        	
        	if(request.getParameter("choix").equals("Ajouter")) {
        		if(request.getParameter("immatriculation")!=null && !request.getParameter("immatriculation").equals("") && !request.getParameter("immatriculation").equals("''")) {
        		Formulaire Form1 = new Formulaire();
        		Form1.setImmatriculation(request.getParameter("immatriculation")); 
                Form1.setModele(request.getParameter("modele")); 
                Form1.setKilometrage(request.getParameter("kilometrage")); 
                Form1.setEtat(request.getParameter("Etat")); 
               
                
                l.add(Form1);
               
        		
        		Iterator<Formulaire> it = l.iterator();
                
                
                while(it.hasNext())
                {
                	Formulaire val = it.next();
                	SetCarform Car1 = new SetCarform();
                	Car1.ajouterVoiture(val);
                 
                }
                l.clear();
        					}
     
        		 final int[] values = { 1, 2, 3 };
        		 Gson gson =new Gson();
        		 
        		 response.setContentType("application/json");
            	SetCarform Car1 = new SetCarform();
            	PrintWriter out =response.getWriter();
            	out.println(gson.toJson( values ));
            	 request.setAttribute("Test", "This value" );
            	 
            	 int CategorieA=0,CategorieB =0;
            	 for (Formulaire car : Car1.recupererVoiture()) {
            		 if(car.getEtat().equals("en cours de location"))
            			 CategorieA++;
            		
            		 if(car.getEtat().equals("disponible"))
            			 CategorieB++;	
            	    }
   	 
            	 
            	 request.setAttribute("CategorieA", CategorieA );
            	 request.setAttribute("CategorieB", CategorieB );
            	 
                 request.setAttribute("Car", Car1.recupererVoiture() );
        		this.getServletContext().getRequestDispatcher("/WEB-INF/carform.jsp").forward(request, response);
        		
        	}
       	 
        }

        	
        }
        
    

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	
    	doGet(request, response);
    	
    /*
        Formulaire Form1 = new Formulaire();
         
        Form1.setImmatriculation(request.getParameter("immatriculation")); 
        Form1.setModele(request.getParameter("modele")); 
        Form1.setKilometrage(request.getParameter("kilometrage")); 
        Form1.setEtat(request.getParameter("Etat")); 
        
        SetCarform Car1 = new SetCarform();
        Car1.ajouterVoiture(Form1);
         */
        
    }
    
    

}