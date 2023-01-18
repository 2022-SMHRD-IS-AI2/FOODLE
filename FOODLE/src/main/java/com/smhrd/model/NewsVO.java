package com.smhrd.model;

import org.jsoup.select.Elements;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

//@Data // 기본생성자, getter, setter, toString, equals..
@AllArgsConstructor // 모든 파라미터를 받는 생성자
//@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메소드
public class NewsVO {
	
//	final 써도 됨
//	private final String email;
	
	private Elements title;
	private Elements text;
	private Elements thumb;

}
