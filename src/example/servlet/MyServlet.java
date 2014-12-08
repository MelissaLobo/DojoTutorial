package example.servlet;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, 
HttpServletResponse response) 
throws ServletException, IOException {

  }

protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
throws ServletException, IOException {
    float janOutlay = Float.parseFloat(request.getParameter("jan_outlay"));
    float janSales = Float.parseFloat(request.getParameter("jan_sales"));
    float febOutlay = Float.parseFloat(request.getParameter("feb_outlay"));
    float febSales = Float.parseFloat(request.getParameter("feb_sales"));
    float marOutlay = Float.parseFloat(request.getParameter("mar_outlay"));
    float marSales = Float.parseFloat(request.getParameter("mar_sales"));
    float aprOutlay = Float.parseFloat(request.getParameter("apr_outlay"));
    float aprSales = Float.parseFloat(request.getParameter("apr_sales"));
    float mayOutlay = Float.parseFloat(request.getParameter("may_outlay"));
    float maySales = Float.parseFloat(request.getParameter("may_sales"));

    float janProfit = janSales - janOutlay;
    float febProfit = febSales - febOutlay;
    float marProfit = marSales - marOutlay;
    float aprProfit = aprSales - aprOutlay;
    float mayProfit = maySales - mayOutlay;

    HashMap<String, Float> map = new HashMap<String, Float>();
    map.put("jan", janProfit);
    map.put("feb", febProfit);
    map.put("mar", marProfit);
    map.put("apr", aprProfit);
    map.put("may", mayProfit);
    	
    Gson gson = new Gson();
    String json = gson.toJson(map);
    System.out.println(json);

    RequestDispatcher dispatcher = null;
    String chartType = request.getParameter("type");
    if (chartType.equals("pie")){
      dispatcher = request.getRequestDispatcher("/pie.jsp");
    }
    else if (chartType.equals("columns")){
      dispatcher = request.getRequestDispatcher("/columns.jsp");
    }
    else {
      dispatcher = request.getRequestDispatcher("/grid.jsp");
    }
    request.setAttribute("result", json);
    dispatcher.forward(request, response);
  }
}