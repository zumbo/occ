package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.EpochRepository;
import ch.aloba.occ.data.TableRepository;

@Stateless
public class EpochRegistration extends TableRegistration {

	@Inject
	EpochRepository repository;
	
	@Override
	protected TableRepository getRepository() {
		return repository;
	}

}
