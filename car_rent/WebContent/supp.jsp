
<%@page import ="java.sql.*" %>

<html>
    <head><title>Drop</title> 
    
     <style >
     
input[readonly]{
  background-color: infobackground;
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}
    input[type=text] {
  width: 50%;
  padding: 8px 0px;
  margin: 5px 0;
  box-sizing: border-box;
}
label{
  width: 20%;
  padding: 5px 5px;
  margin: 8px 0;
  color:  gray;
}



</style>
    </head>

    <%
    String mat=request.getParameter("immatriculation");
    System.out.println("immatriculation :"+request.getParameter("immatriculation"));
   // String mat="zayd";
     try
                        {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection co=null;
                    String conid="jdbc:mysql://localhost:3308/javaee?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                    String login ="root"; String password ="";
                    
                    Connection con1 = DriverManager.getConnection(conid, login, password);
                    
                    
                    Statement s1=con1.createStatement();
                    String req=" select immatriculation, modele, kilometrage, Etat  from voiture  where immatriculation='"+mat+"'";

                    ResultSet res=s1.executeQuery(req);


                    while(res.next())
                        {

                        %>

                        <body>
                            <center>
                                <h2>suppression</h2>

                                <form action ="drop.jsp" method="get">

                              <label for="Etat">Matricule : </label>
										<center>
                                    <input readonly  class="readonly" name ="immatriculation" value="<%=res.getString("immatriculation")%>">
										</center>
                                     
                                     <label for="Etat">modele : </label>
                                     <center>

                                     
                                     <input readonly  class="readonly" name ="modele" value="<%=res.getString("modele")%> ">
                                     </center>


                                     
                                     <label for="Etat">kilometrage : </label>
                                     <center>

                                   
                                     <input readonly  class="readonly" name ="kilometrage" value="<%=res.getString("kilometrage")%> ">
                                     </center>

                                     

									
									<label for="Etat">Etat : </label>
									<center>

                                    
   			    					<input readonly  class="readonly" name ="Etat" value="<%=res.getString("Etat")%> ">
                                     </center>
                                     
                                     <br><br>

                                     <input type="submit" value="supprimer">




                        








                                </form>
                            </center>
                        </body>

                        <%
                        }
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

</html>