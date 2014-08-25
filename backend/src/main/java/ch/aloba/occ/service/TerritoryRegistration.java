package ch.aloba.occ.service;

import ch.aloba.occ.model.Territory;

import javax.ejb.Stateless;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.persistence.EntityManager;

// The @Stateless annotation eliminates the need for manual transaction demarcation
@Stateless
public class TerritoryRegistration {

//    @Inject
//    private Logger log;

    @Inject
    private EntityManager em;

    @Inject
    private Event<Territory> territoryEventSrc;

    public void register(Territory territory) throws Exception {
//        log.info("Registering " + territory.getName());
        em.persist(territory);
        territoryEventSrc.fire(territory);
    }
}
