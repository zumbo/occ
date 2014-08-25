package ch.aloba.occ.test;

import static org.junit.Assert.assertNotNull;

import java.util.logging.Logger;

import javax.inject.Inject;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;

import ch.aloba.occ.model.Territory;
import ch.aloba.occ.service.TerritoryRegistration;
import ch.aloba.occ.util.Resources;

import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(Arquillian.class)
public class TerritoryRegistrationTest {
    @Deployment
    public static Archive<?> createTestArchive() {
        return ShrinkWrap.create(WebArchive.class, "test.war")
                .addClasses(Territory.class, TerritoryRegistration.class, Resources.class)
                .addAsResource("META-INF/test-persistence.xml", "META-INF/persistence.xml")
                .addAsWebInfResource(EmptyAsset.INSTANCE, "beans.xml")
                // Deploy our test datasource
                .addAsWebInfResource("test-ds.xml");
    }

    @Inject
    TerritoryRegistration territoryRegistration;

    @Inject
    Logger log;

    @Test
    public void testRegister() throws Exception {
    	Territory newTerritory = new Territory();
//        newTerritory.setContinent(1);
//        newTerritory.setFictional(0);
//        newTerritory.setIso3166("ch");
        territoryRegistration.register(newTerritory);
        assertNotNull(newTerritory.getId());
//        log.info(newTerritory.getName() + " was persisted with id " + newTerritory.getId());
    }

}
