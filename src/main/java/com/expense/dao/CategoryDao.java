/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.expense.dao;

import com.expense.entity.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Swastik Computer
 */
public class CategoryDao {
   
    
    private final SessionFactory factory;
    
    public CategoryDao(SessionFactory factory){
        this.factory=factory;
    }
    
    public boolean saveCategory(Category c){
        boolean b=false;
        try{
        Session s=this.factory.openSession();
        Transaction tx=s.beginTransaction();
        s.save(c);
        tx.commit();
        s.close();
        b=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }
    
    
      public List<Category> getAllCategoryById(int admin){
       Session s=this.factory.openSession();
       Query q=s.createQuery("from Category as c where c.admin=:admin");
       q.setParameter("admin", admin);
       List<Category> list=q.list();
       return list;
   }
    
     public Category getCategoryById(int id){
        Category c=null;
        try{
            String query="from Category as s where s.id =:id";
            Session session =this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("id", id);
            c=(Category)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return c;
    }
     
     public void updateCategory(Category c){
         Transaction transaction=null;
         try(Session session=this.factory.openSession()){
             transaction=session.beginTransaction();
             session.update(c);
             transaction.commit();
         }catch(Exception e){
             if(transaction!=null){
                 transaction.rollback();
                 e.printStackTrace();
             }
         }
     }
       
}
