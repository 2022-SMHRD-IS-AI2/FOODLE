package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
// final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메
public class FoodVO {
	

	private Integer f_seq;
	
	private String mb_id;
	
	
	
}
