<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>
<head>
<title>Medicine</title>
</head>
<body>

<%
	DBConnection dbCon = new DBConnection();
%>
<h1>Locations Available</h1>
<table border="1" cellpadding="5" cellspacing="2">
    	<thead>
           <tr>
               <th>Medicine</th>
               <th>Pharmacy</th>
               <th>Location</th>
               <th>Quantity</th>
           </tr>
        </thead>
    	<tbody>
<% String user = request.getParameter("username");
String med_id = request.getParameter("medicine_id");
    List<List<String>> result = dbCon.select("SELECT medicine.name, pharmacy.name, location, quantity"
    		+ " FROM pharmacy, medicine, medicine_stock"
    		+ " WHERE medicine_stock.medicine_id = medicine.medicine_id AND medicine.medicine_id = 1;");
    
    for(List<String> row: result) //gets first column of result
	{
    	out.print("<tr>");
    	String current = row.get(0);
    	for (String cell : row) 
    	{
			out.println("<td>" + cell + "</td>");
		}
    	out.print("</tr>");
	}
%>
	</tbody>
</table>
<br>
<br>
<h1>Ingredients</h1>
<table border="1" cellpadding="5" cellspacing="2">
    	<thead>
           <tr>
               <th>Ingredient ID</th>
               <th>Name</th>
           </tr>
        </thead>
    	<tbody>
<%
	List<List<String>> ingredients = dbCon.select("SELECT ingredient.ingredient_id, name"
			+ " FROM ingredient, medicine_ingredients"
			+ " WHERE medicine_id = 1 AND ingredient.ingredient_id = medicine_ingredients.ingredient_id;");
	for(List<String> row: ingredients) //gets first column of result
	{
   		out.print("<tr>");
   		String current = row.get(0);
   		for (String cell : row) 
   		{
			out.println("<td>" + cell + "</td>");
		}
   		out.print("</tr>");
	}

%>
	</tbody>
</table>
</body>
</html>