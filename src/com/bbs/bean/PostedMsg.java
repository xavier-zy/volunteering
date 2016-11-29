/**
 * 
 */
package com.bbs.bean;

/**
 * @author IvanYe
 *
 */
public class PostedMsg {
	private Integer id;
	private String postTitle;
	private String postContent;
	private String publishTime;
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
	 * @return the postTitle
	 */
	public String getPostTitle() {
		return postTitle;
	}
	/**
	 * @param postTitle the postTitle to set
	 */
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	/**
	 * @return the postContent
	 */
	public String getPostContent() {
		return postContent;
	}
	/**
	 * @param postContent the postContent to set
	 */
	public void setPostContent(String postContent) {
		this.postContent = postContent;
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
