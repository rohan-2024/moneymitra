/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.expense.dao;

import com.expense.entity.Expense;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Swastik Computer
 */
public class ExpenseDao {
    
    
    private final SessionFactory factory;
    
    public ExpenseDao(SessionFactory factory){
        this.factory=factory;
    }
    
    public boolean saveExpense(Expense ex){
        boolean b=false;
        try{
        Session s=this.factory.openSession();
        Transaction tx=s.beginTransaction();
        s.save(ex);
        tx.commit();
        s.close();
        b=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }

     public List<Expense> getAllExpenseById(int admin){
       Session s=this.factory.openSession();
       Query q=s.createQuery("from Expense as e where e.admin=:admin");
       q.setParameter("admin", admin);
       List<Expense> list=q.list();
       return list;
   }
     
     public void updateExpense(Expense ex){
         Transaction transaction=null;
         try(Session session=this.factory.openSession()){
             transaction=session.beginTransaction();
             session.update(ex);
             transaction.commit();
         }catch(Exception e){
             if(transaction!=null){
                 transaction.rollback();
                 e.printStackTrace();
             }
         }
     }
     
    public Expense getExpenseById(int id){
        Expense ex=null;
        try{
            String query="from Expense as s where s.id =:id";
            Session session =this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("id", id);
            ex=(Expense)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return ex;
    }
     
      public void deleteExpense(int id) {
    Transaction transaction = null;
    try (Session session = this.factory.openSession()) {
      transaction = session.beginTransaction();
      Expense expense = (Expense)session.get(Expense.class, id);
      if (expense != null) {
        session.delete(expense);
      } 
      transaction.commit();
    } catch (Exception e) {
      if (transaction != null)
        transaction.rollback(); 
      e.printStackTrace();
    } 
  }
      
      public List<Expense> getAllExpenseInDesc(int admin){
          List<Expense> elist=null;
          Session s=this.factory.openSession();
          String sql="from Expense as e WHERE e.admin=:admin ORDER BY id DESC";
          Query q=s.createQuery(sql);
          q.setParameter("admin", admin);
          elist=q.getResultList();
          return elist;
      }
 
}
