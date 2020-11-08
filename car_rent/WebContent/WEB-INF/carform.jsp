<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Test</title>

<style>


div.Div1 {border-style: solid;}

select{
width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}

input[type=text] {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}
label{
  width: 20%;
  padding: 5px 5px;
  margin: 8px 0;
  color:  gray;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

td:hover{
background-color:gray;
cursor:pointer;
}

</style>
<script>

var elements= document.getElementsByTagName('td');
for(var i=0; i<elements.length;i++)
{
(elements)[i].addEventListener("click", function(){
   alert(this.innerHTML);
});
}


</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type ="text/javascript">

//Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

//Draw the chart and set the chart values
function drawChart() {
	
var CategorieA_count= "<%=request.getAttribute("CategorieA")%>" ;
CategorieA_count=parseInt(CategorieA_count)
var CategorieB_count= "<%=request.getAttribute("CategorieB")%>" ;
CategorieB_count=parseInt(CategorieB_count)
var data = google.visualization.arrayToDataTable([
['Task', 'disponibilité'],
['en cours de location', CategorieA_count],
['Disponible', CategorieB_count]
]);







// Optional; add a title and set the width and height of the chart
var options = {'title':'disponibilité', 'width':550, 'height':400};

// Display the chart inside the <div> element with id="piechart"
var chart = new google.visualization.PieChart(document.getElementById('piechart'));
chart.draw(data, options);
}
</script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>


<body>

<div id="piechart"></div>
<div class="Div1">

    <form method="get" action="carform.fr">
        <p>
            <label for="immatriculation">Immatriculation : </label>
            <input type="text" name="immatriculation" id="immatriculation" />
        </p>
        <p>
            <label for="modele">Modèle de la voiture : </label>
            <input type="text" name="modele" id="modele" />
        </p>
        <p>
              
             <label for="kilometrage">kilométrage : </label>
            
            <select name="kilometrage" id="kilometrage">
    			<option value="0 - 5 000 Km">0 - 5 000 Km</option>
   			    <option value="6 000 - 20 000 Km">6 000 - 20 000 Km</option>
   			    <option value="20 000 - 50 000 Km">20 000 - 50 000 Km</option>
    			<option value="50 000 - 150 000 Km">50 000 - 150 000 Km</option>
    			<option value="150 000 - 300 000 Km">150 000 - 300 000 Km</option>
    			<option value="300 000 Km --">300 000 Km -- </option>
  				</select>
            
            
        </p>
        <p>
            <label for="Etat">L’Etat : </label>
            
            <select name="Etat" id="Etat">
    			<option value="disponible">disponible</option>
   			    <option value="en cours de location">en cours de location</option>
    
  				</select>
            
            
            
        </p>
        
         <input type="submit" value ="Ajouter" name="choix">
    </form>
    
     <br> <br>
    </div>
   
 
    <table id="example" class="display" style="width:100%">
  <tr>
    <th>Immatriculation</th>
    <th>Le modèle de la voiture</th>
    <th>kilométrage</th>
	<th>L’Etat</th>
	
  </tr>
  <c:forEach var="car" items="${ Car }">
       <tr>
  
    <td><c:out value=" ${ car.immatriculation }" /></td>
    <c:set var = "immatriculation"  value = "${ car.immatriculation }"/>
    <td><c:out value=" ${ car.modele }" /></td>
    <td><c:out value=" ${ car.kilometrage }" /></td>
    <td><c:out value=" ${ car.etat }" /></td>
   
    <td><a href=<c:out value="modif.jsp?immatriculation=${immatriculation}"/> >Modifier</a></td>
    <td><a href=<c:out value="supp.jsp?immatriculation=${ immatriculation}"/> >supprimer</a></td>
   
    
    
    
    
    
      </tr>
   </c:forEach>
 
</table>



    

    
    
       
</body>
</html>