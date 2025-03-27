/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.expense.dao;

import com.expense.entity.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AdminDao {
    
     private final SessionFactory Factory;

    public AdminDao(SessionFactory Factory) {
        this.Factory = Factory;
        
        
    }
      public boolean saveAdmin(Admin a) {
        boolean f = false;
        try{
            Session session = this.Factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(a);
            tx.commit();
            session.close();
             f = true;
        }
         catch(Exception e){
            f = false;
            e.printStackTrace();
        }
        return f;
    }
      
       public Admin getAdminByEmailandPassword(String email, String password){
       Admin admin=null;
        try{
            String query="from Admin as a where a.email=:email and a.password=:p";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("email", email);
            q.setParameter("p", password);
            admin=(Admin)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return admin;
    }
       public void updateAdmin(int id ,String email, String password){
            Transaction tx=null;
             try(Session session=this.Factory.openSession()){
             tx=session.beginTransaction();
            Admin admin=(Admin)session.load(Admin.class, id);
             admin.setPassword(password);
             admin.setEmail(email);
             session.update(admin);
             tx.commit();
             session.close();
             }
             catch(Exception e){
                 if(tx!=null){
                 tx.rollback();
                 e.printStackTrace();
                
             }
             }
            
         }
       
          
}
