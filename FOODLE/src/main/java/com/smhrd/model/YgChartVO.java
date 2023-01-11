package com.smhrd.model;

import java.time.LocalDate;

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
		
		private int weight_seq;
		@NonNull
		private int curr_weight;
		private LocalDate weight_regdt;
		@NonNull
		private String mb_id;
	
		
		
		
	}


