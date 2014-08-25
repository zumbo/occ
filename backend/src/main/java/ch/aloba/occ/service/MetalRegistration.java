package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.MetalRepository;
import ch.aloba.occ.data.TableRepository;

@Stateless
public class MetalRegistration extends TableRegistration {
	@Inject
	MetalRepository repository;
	
	@Override
	protected TableRepository getRepository() {
		return repository;
	}
}
