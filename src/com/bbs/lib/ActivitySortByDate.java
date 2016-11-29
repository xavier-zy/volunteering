package com.bbs.lib;

import java.util.Comparator;

import com.bbs.bean.Activity;

public class ActivitySortByDate implements Comparator{
	public int compare(Object o1, Object o2) {
		  Activity s1 = (Activity) o1;
		  Activity s2 = (Activity) o2;
		  return s2.getActivityDate().compareTo(s1.getActivityDate());
		 }
}
