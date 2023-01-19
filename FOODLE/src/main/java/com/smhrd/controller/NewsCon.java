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
		
		
		// 안쓰는 페이지입니다 테스트용 코드입니다!!!!!
		
		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=탄수화물";
		
		Document doc = Jsoup.connect(url).get();
		
		
		String a = doc.html();
//		System.out.println(a);
		
		
		Elements elem = doc.select("#sp_nws1 a.dsc_thumb>img");
		
		System.out.println("시작임");
		System.out.println(elem.toString());
		System.out.println("끝임");
		System.out.println();
		System.out.println();
		System.out.println();
		
		System.out.println(elem.attr("data-lazysrc"));
		
//		System.out.println(elem.attr("href"));
		
		
		
	}

}
