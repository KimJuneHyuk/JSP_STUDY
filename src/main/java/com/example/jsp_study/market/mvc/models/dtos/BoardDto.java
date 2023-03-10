package com.example.jsp_study.market.mvc.models.dtos;

public class BoardDto {
    private int num;
    private String id;
    private String name;
    private String subject;
    private String content;
    private String registDay;
    private int hit;
    private String ip;

    public BoardDto() {
    }

    public BoardDto(int num, String id, String name, String subject, String content, String registDay, int hit, String ip) {
        this.num = num;
        this.id = id;
        this.name = name;
        this.subject = subject;
        this.content = content;
        this.registDay = registDay;
        this.hit = hit;
        this.ip = ip;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegistDay() {
        return registDay;
    }

    public void setRegistDay(String registDay) {
        this.registDay = registDay;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public String getIp() {
        return ip;
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "num=" + num +
                ", id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", registDay='" + registDay + '\'' +
                ", hit=" + hit +
                ", ip='" + ip + '\'' +
                '}';
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
