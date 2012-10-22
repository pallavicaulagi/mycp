// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package in.mycp.domain;

import in.mycp.domain.AccountLog;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AccountLog_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager AccountLog.entityManager;
    
    public static final EntityManager AccountLog.entityManager() {
        EntityManager em = new AccountLog().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AccountLog.countAccountLogs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AccountLog o", Long.class).getSingleResult();
    }
    
    public static List<AccountLog> AccountLog.findAllAccountLogs() {
        return entityManager().createQuery("SELECT o FROM AccountLog o", AccountLog.class).getResultList();
    }
    
    public static AccountLog AccountLog.findAccountLog(Integer id) {
        if (id == null) return null;
        return entityManager().find(AccountLog.class, id);
    }
    
    public static List<AccountLog> AccountLog.findAccountLogEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AccountLog o", AccountLog.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void AccountLog.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AccountLog.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AccountLog attached = AccountLog.findAccountLog(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AccountLog.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AccountLog.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public AccountLog AccountLog.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AccountLog merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}