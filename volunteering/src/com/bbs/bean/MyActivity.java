/**
 * 
 */
package com.bbs.bean;

/**
 * @author IvanYe
 *
 */
public class MyActivity {
	private Integer id;
	private  String activityStatus;
	private Integer activityId;
	private Integer userId;
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the activityId
	 */
	public Integer getActivityId() {
		return activityId;
	}
	/**
	 * @param activityId the activityId to set
	 */
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}
	/**
	 * @return the activityStatus
	 */
	public String getActivityStatus() {
		return activityStatus;
	}
	/**
	 * @param activityStatus the activityStatus to set
	 */
	public void setActivityStatus(String activityStatus) {
		this.activityStatus = activityStatus;
	}

	/**
	 * @return the userId
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
