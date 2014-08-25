package ch.aloba.occ.service;

import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.model.L10nEntity;

public abstract class L10nRegistration {
    @Inject
    protected EntityManager em;

    @Inject
    private Event<L10nEntity> territoryEventSrc;

    public void register(L10nEntity gradel10n) throws Exception {
        em.persist(gradel10n);
        territoryEventSrc.fire(gradel10n);
    }
    

}
