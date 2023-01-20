package com.example.jsp_study.market.mvc.models.dtos;

import java.util.Date;

public class RippleDto {
//  댓글 관련 테이블 단점.
//    댓글에 광고글이나 스팸글이 올라 올 경우 대응이 불가능할 수 있다.

    private int rippleId;
    private String boardName;
    private int boardNum;
    private String memberId;
    private String name;
    private String content;
    private Date insertDate;
    private String ip;

    public RippleDto() {
    }

    public RippleDto(int rippleId, String boardName, int boardNum, String memberId, String name, String content, Date insertDate, String ip) {
        this.rippleId = rippleId;
        this.boardName = boardName;
        this.boardNum = boardNum;
        this.memberId = memberId;
        this.name = name;
        this.content = content;
        this.insertDate = insertDate;
        this.ip = ip;
    }

    public int getRippleId() {
        return rippleId;
    }

    public void setRippleId(int rippleId) {
        this.rippleId = rippleId;
    }

    public String getBoardName() {
        return boardName;
    }

    public void setBoardName(String boardName) {
        this.boardName = boardName;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getInsertDate() {
        return insertDate;
    }

    public void setInsertDate(Date insertDate) {
        this.insertDate = insertDate;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
