package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class NewsCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=%ED%83%84%EC%88%98%ED%99%94%EB%AC%BC";
		
		Document doc = Jsoup.connect(url).get();
		
		
		String a = doc.html();
//		System.out.println(a);
		
		Elements elem = doc.select("#sp_nws2 .news_tit");
		Elements elem2 = doc.select("#sp_nws2 img.thumb.api_get");
		System.out.println(elem.text());
		System.out.println(elem2.html());
		
		
		
	}

}
