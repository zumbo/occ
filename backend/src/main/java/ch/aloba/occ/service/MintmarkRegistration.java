package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.MintmarkRepository;
import ch.aloba.occ.data.TableRepository;

@Stateless
public class MintmarkRegistration extends TableRegistration {
	@Inject
	MintmarkRepository repository;
	
	@Override
	protected TableRepository getRepository() {
		return repository;
	}
}
