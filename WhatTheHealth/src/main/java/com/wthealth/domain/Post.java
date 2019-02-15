package com.wthealth.domain;

import java.sql.Date;

public class Post {
   
   private int postNo;
   private String userId;
   private String title;
   private String contents;
   private String nickName;
   private String userImage;
   private String photo;
   private String video;
   private int clickCount;
   private String blindStatus;
   private String deleteStatus;
   private int likeCount;
   private String category;
   private Date postDate;
   private String postSubNo;
   private String youtube;
   ///////////////////커뮤니티////////////////////
   private int exScNo;
   private int dietScNo;
   //////////////////운동정보게시물////////////////
   private int exInfoNo;
   private int exCalorie;
   private String exPlace;
   private String exPart;
   private String exVideoTime;
   //////////////////위치태그///////////////////
   private String locationTagName;
   private String coordinate;
   private String address;
   /////////////////관심사/////////////
   private int favoriteNo;
   private String pressedStatus;
   private String favoriteType;
   
   
   public Post() {
   }

   public int getPostNo() {
      return postNo;
   }

   public void setPostNo(int postNo) {
      this.postNo = postNo;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContents() {
      return contents;
   }

   public void setContents(String contents) {
      this.contents = contents;
   }

   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
   }

   public String getPhoto() {
      return photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }

   public String getVideo() {
      return video;
   }

   public void setVideo(String video) {
      this.video = video;
   }

   public int getClickCount() {
      return clickCount;
   }

   public void setClickCount(int clickCount) {
      this.clickCount = clickCount;
   }

   public String getBlindStatus() {
      return blindStatus;
   }

   public void setBlindStatus(String blindStatus) {
      this.blindStatus = blindStatus;
   }

   public String getDeleteStatus() {
      return deleteStatus;
   }

   public void setDeleteStatus(String deleteStatus) {
      this.deleteStatus = deleteStatus;
   }

   public int getLikeCount() {
      return likeCount;
   }

   public void setLikeCount(int likeCount) {
      this.likeCount = likeCount;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public Date getPostDate() {
      return postDate;
   }

   public void setPostDate(Date postDate) {
      this.postDate = postDate;
   }

   public int getExScNo() {
      return exScNo;
   }

   public void setExScNo(int exScNo) {
      this.exScNo = exScNo;
   }

   public int getDietScNo() {
      return dietScNo;
   }

   public void setDietScNo(int dietScNo) {
      this.dietScNo = dietScNo;
   }

   public int getExInfoNo() {
      return exInfoNo;
   }

   public void setExInfoNo(int exInfoNo) {
      this.exInfoNo = exInfoNo;
   }

   public int getExCalorie() {
      return exCalorie;
   }

   public void setExCalorie(int exCalorie) {
      this.exCalorie = exCalorie;
   }

   public String getExPlace() {
      return exPlace;
   }

   public void setExPlace(String exPlace) {
      this.exPlace = exPlace;
   }

   public String getExPart() {
      return exPart;
   }

   public void setExPart(String exPart) {
      this.exPart = exPart;
   }

   public String getExVideoTime() {
      return exVideoTime;
   }

   public void setExVideoTime(String exVideoTime) {
      this.exVideoTime = exVideoTime;
   }

   public String getLocationTagName() {
      return locationTagName;
   }

   public void setLocationTagName(String locationTagName) {
      this.locationTagName = locationTagName;
   }

   public String getCoordinate() {
      return coordinate;
   }

   public void setCoordinate(String coordinate) {
      this.coordinate = coordinate;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public int getFavoriteNo() {
      return favoriteNo;
   }

   public void setFavoriteNo(int favoriteNo) {
      this.favoriteNo = favoriteNo;
   }

   public String getPressedStatus() {
      return pressedStatus;
   }

   public void setPressedStatus(String pressedStatus) {
      this.pressedStatus = pressedStatus;
   }

   public String getFavoriteType() {
      return favoriteType;
   }

   public void setFavoriteType(String favoriteType) {
      this.favoriteType = favoriteType;
   }

   public String getPostSubNo() {
      return postSubNo;
   }

   public void setPostSubNo(String postSubNo) {
      this.postSubNo = postSubNo;
   }

   public String getUserImage() {
      return userImage;
   }

   public void setUserImage(String userImage) {
      this.userImage = userImage;
   }
   
   public String getYoutube() {
      return youtube;
   }

   public void setYoutube(String youtube) {
      this.youtube = youtube;
   }

   @Override
   public String toString() {
      return "Post [postNo=" + postNo + ", userId=" + userId + ", title=" + title + ", contents=" + contents
            + ", nickName=" + nickName + ", userImage=" + userImage + ", photo=" + photo + ", video=" + video
            + ", clickCount=" + clickCount + ", blindStatus=" + blindStatus + ", deleteStatus=" + deleteStatus
            + ", likeCount=" + likeCount + ", category=" + category + ", postDate=" + postDate + ", postSubNo="
            + postSubNo + ", youtube=" + youtube + ", exScNo=" + exScNo + ", dietScNo=" + dietScNo + ", exInfoNo="
            + exInfoNo + ", exCalorie=" + exCalorie + ", exPlace=" + exPlace + ", exPart=" + exPart
            + ", exVideoTime=" + exVideoTime + ", locationTagName=" + locationTagName + ", coordinate=" + coordinate
            + ", address=" + address + ", favoriteNo=" + favoriteNo + ", pressedStatus=" + pressedStatus
            + ", favoriteType=" + favoriteType + "]";
   }

   
}