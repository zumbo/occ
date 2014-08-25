package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.QualityRepository;
import ch.aloba.occ.data.TableRepository;

@Stateless
public class QualityRegistration extends TableRegistration {
	@Inject
	QualityRepository repository;
	
	@Override
	protected TableRepository getRepository() {
		return repository;
	}
}
