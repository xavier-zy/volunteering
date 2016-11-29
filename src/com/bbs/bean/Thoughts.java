/**
 * 
 */
package com.bbs.bean;

/**
 * @author IvanYe
 *
 */
public class Thoughts {
	private Integer id;
	private String thoughtsTitle;
	private String thoughtsContent;
	private Integer userId;
	private String publishTime;
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
	 * @return the publishTime
	 */
	public String getPublishTime() {
		return publishTime;
	}
	/**
	 * @param publishTime the publishTime to set
	 */
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	/**
	 * @return the thoughtsTitle
	 */
	public String getThoughtsTitle() {
		return thoughtsTitle;
	}
	/**
	 * @param thoughtsTitle the thoughtsTitle to set
	 */
	public void setThoughtsTitle(String thoughtsTitle) {
		this.thoughtsTitle = thoughtsTitle;
	}
	/**
	 * @return the thoughtsContent
	 */
	public String getThoughtsContent() {
		return thoughtsContent;
	}
	/**
	 * @param thoughtsContent the thoughtsContent to set
	 */
	public void setThoughtsContent(String thoughtsContent) {
		this.thoughtsContent = thoughtsContent;
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
