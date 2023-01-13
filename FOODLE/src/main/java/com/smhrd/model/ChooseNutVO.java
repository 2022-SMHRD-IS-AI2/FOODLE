package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
//@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메

public class ChooseNutVO {

	private String mb_fav_ingrident;
	private String mb_id;

}
