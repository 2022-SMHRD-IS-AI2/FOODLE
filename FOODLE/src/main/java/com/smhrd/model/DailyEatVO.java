package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
//@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메

public class DailyEatVO {
	
	private String f_ch;
	private String f_pro;
	private String f_fat;
	private String f_sugar;
	private String f_sodium;
	private String f_col;
	private String f_fad;
	private String f_trans;
	

}
