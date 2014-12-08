<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" 
"http://www.w3.org/TR/html4/strict.dtd">
<html dir="ltr">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <style type="text/css">
         body, html { font-family:helvetica,arial,sans-serif; font-size:90%; }
      </style>
      <script src="http://ajax.googleapis.com/ajax/libs/dojo/1.6/dojo/dojo.xd.js"
        djConfig="parseOnLoad: true">
      </script>
      <script>
         dojo.require("dojo.data.ItemFileWriteStore");
         dojo.require("dojox.grid.DataGrid");
            
         <% 
    	    String result = (String) request.getAttribute("result");
    	    if (result != null) {
         %>
    	      var json = <%=result %>;
         <%	
    	    }
         %>

         var profits = [{'mounth': 'Janeiro', 'profit': json.jan},
                       {'mounth': 'Fevereiro', 'profit': json.feb},
                        {'mounth': 'Março',	'profit': json.mar},
                       {'mounth': 'Abril', 	'profit': json.apr},
                       {'mounth': 'Maio', 'profit': json.may}];
         var profitData = {            
            'items': profits
         };
         var profitLayout = [
             [{
            field: "mounth",
            name: "Mês",
            width: 10
         },
         {
            field: "profit",
            name: "Lucro",
            width: 10
         }]];
      </script>
      <link rel="stylesheet" type="text/css"  
        href="http://ajax.googleapis.com/ajax/
        libs/dojo/1.6/dijit/themes/claro/claro.css" />
      <link rel="stylesheet" type="text/css" 
        href="http://ajax.googleapis.com/ajax/libs/dojo/1.6/
        dojox/grid/resources/Grid.css" />
      <link rel="stylesheet" type="text/css" 
        href="http://ajax.googleapis.com/ajax/libs/dojo/
        1.6/dojox/grid/resources/nihiloGrid.css" />
      <style type="text/css">
         .dojoxGrid table { margin: 0; }
      </style>
   </head>    
   <body class="claro">
      <div dojoType="dojo.data.ItemFileWriteStore" data="profitData" jsId="profitStore"></div>
      <h3>Lucro durante os meses</h3>
      <div id="grid" style="width: 276px; height: 170px;" 
       dojoType="dojox.grid.DataGrid" store="profitStore" structure="profitLayout"></div>
   </body>
</html>