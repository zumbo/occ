package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.GradeRepository;
import ch.aloba.occ.data.TableRepository;

@Stateless
public class GradeRegistration extends TableRegistration {

	@Inject
	GradeRepository repository;
	
	@Override
	protected TableRepository getRepository() {
		return repository;
	}

}
