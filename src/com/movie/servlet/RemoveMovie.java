package com.movie.servlet;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/RemoveMovie")
public class RemoveMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	JSONArray jarray = new JSONArray();

	public RemoveMovie() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String value = request.getParameter("index");		
		//index to be deleted
		int index = Integer.parseInt(value);
		JSONParser parser = new JSONParser(); 
  	JSONArray array = new JSONArray();
  	//reading the json file
  	FileWriter jsonFile = null;
		try {
			array = (JSONArray)parser.parse(new FileReader("./favorite.json"));
			array.remove(index);
			
			//writing the array to the same file
			jsonFile =  new FileWriter("./favorite.json");
			jsonFile.write(array.toString());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}finally {
			jsonFile.flush();
		}		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}