package blogDao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import dataQuery.BlogQuery;

public class test {

	public static void main(String[] args) {
		int i = BlogQuery.editAboutMe("1", "Пе");
		System.out.println(i);
	}

}
