package com.lyh.manage.entity;

public class Department {
    private String id;

    private String number;

    private String name;

    private Integer quantity;

    private Integer posNum;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getPosNum() {
        return posNum;
    }

    public void setPosNum(Integer posNum) {
        this.posNum = posNum;
    }
}
