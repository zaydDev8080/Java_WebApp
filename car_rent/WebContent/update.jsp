
<%@page import ="java.sql.*" %>


        <%

        String immatriculation= request.getParameter("immatriculation");
        String modele = request.getParameter("modele");
         String kilometrage =request.getParameter("kilometrage");
         String Etat =request.getParameter("Etat");
		 System.out.print("|| immatriculation : "+immatriculation+"  modele : "+modele+"   kilometrage : "+kilometrage+"  Etat : "+Etat+"");

 //select immatriculation, modele, kilometrage, Etat  from voiture  where immatriculation='"+mat+"'"
         try
                        {
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection co=null;
                    String conid="jdbc:mysql://localhost:3308/javaee?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String login ="root"; String password ="";
                    
                    Connection con1 = DriverManager.getConnection(conid, login, password);
                  
                    Statement s1=con1.createStatement();
                    String req="update voiture set Etat='"+Etat+"',modele='"+modele+"', kilometrage='"+kilometrage+"' where immatriculation ='"+immatriculation+"'";
                    //String req="delete from employe where mat ="+mat+"
                    int res=s1.executeUpdate(req);

                    ServletContext ct =request.getServletContext();
                    RequestDispatcher dis=ct.getRequestDispatcher("/WEB-INF/carform.jsp");
                    dis.forward(request, response);

                    }

         catch(ClassNotFoundException ee)
                        {
                    out.println("err pilote");
                    }


                catch(SQLException ff)
                        {
                    out.println("err de requete");

                    }






        %>