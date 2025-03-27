
package com.expense.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProduct {
    
    private static SessionFactory factory;

    public static SessionFactory getFactory() {
        
        
        try {
            
            if (factory==null) {
                factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        
        
        return factory;
    }
    
    
    
    
}
