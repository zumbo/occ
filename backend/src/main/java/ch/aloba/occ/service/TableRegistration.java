package ch.aloba.occ.service;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.model.MainEntity;

public abstract class TableRegistration {
    @Inject
    protected EntityManager em;
    
    protected abstract TableRepository getRepository();

    public int register(MainEntity entity) throws Exception {
    	if (entity.getId() == 0) {
    		em.persist(entity);
    	}
    	else {
    		em.merge(entity);
    	}
        return entity.getId();
    }    
    
    public void delete(int id) {
		MainEntity entity = getRepository().findById(id);
		if (entity != null) {
			em.remove(entity);
		}
	}
}
