package com.roomrsv.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

public class Test {
	public static void main(String[] args) {
		String str = "1989-11-22";
		LocalDate rsv_date = LocalDate.parse(str);
		Integer stay = new Integer(1);
		System.out.print(rsv_date.plusDays(stay));
	}
}
