package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

//@Data // 기본생성자, getter, setter, toString, equals..
@AllArgsConstructor // 모든 파라미터를 받는 생성자
@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메소드

public class MemberVO {
	
//	final 써도 됨
//	private final String email;
	
	@NonNull
	private String mb_id;
	@NonNull
	private String mb_pw;
	private String mb_name;
	private String mb_bloodtype;
	private String mb_phone;
	private String mb_height;
	private String mb_weight;
	private String mb_gender;
	private String mb_fav_ingredient;

}
