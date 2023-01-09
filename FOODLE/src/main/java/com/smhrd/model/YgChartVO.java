package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메
public class YgChartVO {
		
		@NonNull
		private String mb_id;
		@NonNull
		private String curr_wg;
		private String date;
	
		
		
		
	}


