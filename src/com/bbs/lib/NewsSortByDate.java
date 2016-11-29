package com.bbs.lib;

import java.util.Comparator;

import com.bbs.bean.News;

public class NewsSortByDate implements Comparator {
	public int compare(Object o1, Object o2){
		News s1 = (News) o1;
		News s2 = (News) o2;
		return s2.getPublishtime().compareTo(s1.getPublishtime());
		
	}

}
