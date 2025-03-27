/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.expense.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


/**
 *
 * @author Swastik Computer
 */
@Entity
public class Category {
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    private String name;
    private String catType;
    private int admin;

    public Category() {
    }

    public Category(String name,String catType, int admin) {
        this.name = name;
        this.catType=catType;
        this.admin = admin;
    }
 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCatType() {
        return catType;
    }

    public void setCatType(String catType) {
        this.catType = catType;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", name=" + name + ", catType=" + catType + ", admin=" + admin + '}';
    }

    }
    