package com.cqut.generalCourse.entity;

public class TranslateToInt {
	//转化为整数
		public static int getInterger(Object values){
			Double d = new Double((Double)values);
			return d.intValue();
		}
}
