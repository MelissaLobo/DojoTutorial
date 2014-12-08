<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style type="text/css">
body, html {
	font-family: helvetica, arial, sans-serif;
	font-size: 90%;
}
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/dojo/1.6/
     dojo/dojo.xd.js"
	djConfig="parseOnLoad: true"></script>
<script type="text/javascript">
      dojo.require(dojox.charting.Chart2D);
      dojo.require(dojox.charting.widget.Chart2D);
      dojo.require(dojox.charting.themes.PlotKit.blue);

      <%String result = (String) request.getAttribute("result");
			if (result != null) {%>
            var json = <%=result%>;
      <%}%>
      //x corresponde a posição no eixo x do grafico, e y ao valor do lucro do mes
      var chartData = [];
      chartData.push({ x: 1, y: json.jan, text: "Jan"});
      chartData.push({ x: 2, y: json.feb, text: "Fev"});
      chartData.push({ x: 3, y: json.mar, text: "Mar"});
      chartData.push({ x: 4, y: json.apr, text: "Abr"});
      chartData.push({ x: 5, y: json.may, text: "Mai"});
        
      dojo.ready(function() {
         var chart = new dojox.charting.Chart2D(chart).
            setTheme(dojox.charting.themes.PlotKit.blue).
            
          //  add os exiso x e y com a função addAxis()
            addAxis(x, { min:0, max:6}).
            addAxis(y, { vertical: true, min:0}).
            addPlot(default, { type: Columns, gap:5 }).
            addSeries(Lucro por período, chartData);
         
         //efeitos:
         var anim4b = new dojox.charting.action2d.Tooltip
         (chart, default);
         var anim4c = new dojox.charting.action2d.Shake
         (chart,default);
         chart.render();
         var legend = new dojox.charting.widget.Legend
         ({ chart: chart }, legend);
      });
    </script>

<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/
     dojo/1.6/dijit/themes/claro/claro.css" />
<link rel="stylesheet" type="text/css"
	href="dojox/grid/resources/Grid.css" />
<link rel="stylesheet" type="text/css"
	href="dojox/grid/resources/nihiloGrid.css" />
<style type="text/css">
.dojoxGrid table {
	margin: 0;
}
</style>
</head>

<body class="claro">
	<h3>Gráfico gerado</h3>
	<div id="chart" style="width: 260px; height: 200px;"></div>
	<div id="legend"></div>
</body>
</html>