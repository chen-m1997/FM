package com.entity;

import java.io.Serializable;
import java.util.Date;

public class Goods implements Serializable {
	private int id;
	private String goodsName; 
	private double price;  
	private String imgPath;
	private Date deployDate; 
	private String description;
	private int typeId;

	private GoodsType goodsType;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the goodsName
	 */
	public String getGoodsName() {
		return goodsName;
	}

	/**
	 * @param goodsName the goodsName to set
	 */
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the imgPath
	 */
	public String getImgPath() {
		return imgPath;
	}

	/**
	 * @param imgPath the imgPath to set
	 */
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	/**
	 * @return the deployDate
	 */
	public Date getDeployDate() {
		return deployDate;
	}

	/**
	 * @param deployDate the deployDate to set
	 */
	public void setDeployDate(Date deployDate) {
		this.deployDate = deployDate;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the typeId
	 */
	public int getTypeId() {
		return typeId;
	}

	/**
	 * @param typeId the typeId to set
	 */
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	/**
	 * @return the goodsType
	 */
	public GoodsType getGoodsType() {
		return goodsType;
	}

	/**
	 * @param goodsType the goodsType to set
	 */
	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Goods [id=" + id + ", goodsName=" + goodsName + ", price=" + price + ", imgPath=" + imgPath
				+ ", deployDate=" + deployDate + ", description=" + description + ", typeId=" + typeId + ", goodsType="
				+ goodsType + "]";
	}


}
