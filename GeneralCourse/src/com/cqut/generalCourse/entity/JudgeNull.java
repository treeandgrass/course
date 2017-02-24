package com.cqut.generalCourse.entity;

public class JudgeNull {
//	×Ö·û´®Îª¿Õ·µ»Øfalse
	public static boolean isNull(Object values){
		return values!=null&&!"".equals(values)&&" "!=values;
	}
	
}
