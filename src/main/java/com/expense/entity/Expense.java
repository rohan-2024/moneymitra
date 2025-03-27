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
public class Expense {
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
    private String title;
    private String expenseDate;
    private double amount;
    private int admin;
    private int category;
    
    public Expense() {
    }

    public Expense(String title, String expenseDate, double amount, int admin, int category) {
        this.title = title;
        this.expenseDate = expenseDate;
        this.amount = amount;
        this.admin = admin;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(String expenseDate) {
        this.expenseDate = expenseDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

      @Override
    public String toString() {
        return "Expense{" + "id=" + id + ", title=" + title + ", expenseDate=" + expenseDate + ", amount=" + amount + ", admin=" + admin + ", category=" + category + '}';
    }


}
