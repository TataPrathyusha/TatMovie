package com.movie.servlet;

import java.io.File;
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

@WebServlet("/JsonParsing")
public class JsonParsing extends HttpServlet {
	// global array
	static JSONArray jarray = new JSONArray();
	private static final long serialVersionUID = 1L;

	// array of json objects
	public JsonParsing() {
		super();
	}
	// go get method to receive the request from jsp page
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// creating json object,array and a parser
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		JSONParser parser = new JSONParser();

		// setting response type
		response.setContentType("application/json");
		// sending the response
		String moviename = request.getParameter("moviename");
		PrintWriter out = response.getWriter();
		// show the movie added
		out.print("Added <b>" + moviename + "</b> to your favorites");

		// retrieving the values from the request
		String rating = request.getParameter("ratings");
		String releasedate = request.getParameter("releasedate");
		String poster = request.getParameter("poster");
		String overview = request.getParameter("overview");

		// storing key value pairs getting from GET
		// json object to store key value pairs
		json.put("moviename", moviename);
		json.put("rating", rating);
		json.put("releasedate", releasedate);
		json.put("poster", poster);
		json.put("overview", overview);

		// opening file
		File f = new File("./jsonfile/favorite.json");
		// checking if file exits or not
		if (f.exists()) {
			try {
				// if array exists already take the values from array else we will make a new
				// file
				jarray = (JSONArray) parser.parse(new FileReader("./favorite.json"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		// if array size is less then 10 then only adding in array
		if (jarray.size() < 10) {
			jarray.add(json);
			FileWriter jsonFile = null;
			try {
				// over writing the previously existing file
				jsonFile = new FileWriter("./jsonfile/favorite.json");
				jsonFile.write(jarray.toString());
				System.out.println(json.toString());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				jsonFile.flush();
			}
		} else {
			System.out.println("Trying to add more than 10 favourites");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}