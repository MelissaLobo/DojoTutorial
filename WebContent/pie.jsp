<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
       body, html { font-family:helvetica,arial,
       sans-serif; font-size:90%; }
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/
     dojo/1.6/dojo/dojo.xd.js" djConfig="parseOnLoad: true"></script>
    <script type="text/javascript">
    
 		 //importação do tema MiamiNice
       dojo.require(dojox.charting.Chart2D);
       dojo.require(dojox.charting.widget.Chart2D);
       dojo.require(dojox.charting.themes.MiamiNice);

       <% 
       
       //array JavaScript para armazenar os dados para o gráfico, 
       //cada text corresponde ao nome de cada fatia no grafico, 
       //e o atributo y, que corresponde ao valor da fatia
          String result = (String) request.getAttribute("result");
          if (result != null) {
       %>
             var json = <%=result %>;
       <%	
          }
       %>
       var chartData = [];            
       chartData.push({ text: "Jan", y: json.jan});
       chartData.push({ text: "Fev", y: json.feb});
       chartData.push({ text: "Mar", y: json.mar});
       chartData.push({ text: "Abr", y: json.apr});
       chartData.push({ text: "Mai", y: json.may});

       // dojo.ready(), responsavel por criar o grafico no momento que a pagina for carregada
       dojo.ready(function() {
          var chart = new dojox.charting.Chart2D(chart).
       
          //setTheme() para selecionar o tema e depois chamamos a função addPlot(), a qual config o tipo de grafico. 
          setTheme(dojox.charting.themes.MiamiNice).
             addPlot("default", {
                type: "Pie",
                font: "normal normal 11pt Tahoma",
                fontColor: "black",
                labelOffset: -30,
                radius: 80
                
        //No metodo addSeries(). definimos um nome apra o nosso conjunto de dados e depois passamos o array com os dados de lucro que o formarão
             }).addSeries("Distribuição Lucro", chartData);
          var anim = new dojox.charting.action2d.MoveSlice
          (chart, default);
          chart.render();                
          var legend = new dojox.charting.widget.Legend
          ({chart: chart}, "legend");
       });
    </script>
    <link rel="stylesheet" type="text/css" 
     href="http://ajax.googleapis.com/ajax/libs/
     dojo/1.6/dijit/themes/claro/claro.css" />
  </head>
  <body class="claro">
    <h3>Gráfico gerado</h3>
    <div id="chart" style="width:300px;height:220px;"></div>
    <div id="legend"></div>
  </body>
</html>