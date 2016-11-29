package com.bbs.lib;

import java.util.Comparator;

import com.bbs.bean.Thoughts;

public class ThoughtsSortByDate implements Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		// TODO Auto-generated method stub
		Thoughts s1 = (Thoughts)  o1;
		Thoughts s2 = (Thoughts)  o2;
		return s2.getPublishTime().compareTo(s1.getPublishTime());
	}

}
