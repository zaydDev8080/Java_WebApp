
<%@page import ="java.sql.*" %>

<html>
    <head><title>Modifier </title> 
    <style >
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
input[readonly]{
  background-color: infobackground;
}
select{
width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}
</style>
    </head>

    <%
    
    
    String mat=request.getParameter("immatriculation");
    System.out.print("immatriculation :"+request.getParameter("immatriculation"));
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
                                <h2>Modification</h2>

                                <form action ="update.jsp" method="get">
						
                                    
										<label for="Etat">Matricule : </label>
										<center>
                                   <input readonly  class="readonly" name ="immatriculation" value="<%=res.getString("immatriculation")%>">
										</center>
                                     
                                     <label for="Etat">modele : </label>
                                     <center>

                                     <input type="text" name ="modele" value="<%=res.getString("modele")%>">
                                     </center>


                                     
                                     <label for="Etat">kilometrage : </label>
                                     <center>

                                     <input type="text" name ="kilometrage" value="<%=res.getString("kilometrage")%>">
                                     </center>

                                     

									
									<label for="Etat">Etat : </label>
									<center>

                                    
                                     
                                     <select name="Etat" id="Etat">
                                     		<option value="<%=res.getString("Etat")%>"><%=res.getString("Etat")%></option>
    										<option value="disponible">disponible</option>
   			    							<option value="en cours de location">en cours de location</option>
    
  									</select>
                                     
                                     </center>
                                     
                                     <br><br>

                                     <input type="submit" value="Modifier">








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