package com.movie.servlet;

import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/RetriveFromJson")
public class RetriveFromJson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RetriveFromJson() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// setting the response tyoe
		PrintWriter out = response.getWriter();
		// creating json parser and array to retrieve value from json

		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		try {
			// opening the file and parsing in json object
			arr = (JSONArray) parser.parse(new FileReader("./favorite.json"));
			// sending the response
				out.println(arr);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}