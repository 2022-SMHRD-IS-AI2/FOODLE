package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
// final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@RequiredArgsConstructor
@Getter // getter메
public class FoodVO {
	

	private Integer u_f_seq;
	@NonNull
	private Integer f_seq;
	@NonNull
	private String mb_id;
	private String u_f_dt;
	
	
}
