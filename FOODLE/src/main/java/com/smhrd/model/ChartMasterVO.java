package com.smhrd.model;

import java.util.List;

import org.jsoup.select.Elements;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
//@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor
@Getter // getter메
public class ChartMasterVO {
	// weight, eat_food, dailyKcal, dailyc, dailyeat

	private List<YgChartVO> weight;
	private BwChartVO eat_food;
	private List<DailyChartVO> dailykcal;
	private List<DailyChooseVO> dailyc;
	private DailyEatVO dailyeat;
	private NewsVO nvo;

}
