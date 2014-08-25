package ch.aloba.occ.rest;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;

import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.model.MainEntity;
import ch.aloba.occ.service.TableRegistration;

public abstract class MainRESTService extends RESTService {
	protected Response listAll() {
		List<? extends MainEntity> entities = getRepository().findAll();
		return createResponse(Response.Status.OK, entities);
	}
	
	public Response listByTerritory(Integer territoryId) {
		List<? extends MainEntity> entities = getRepository().findByTerritory(territoryId);
		return createResponse(Response.Status.OK, entities);
	}

	protected Response lookupById(int id) {
		MainEntity entity = getRepository().findById(id);
		if (entity == null) {
			throw new WebApplicationException(Response.Status.NOT_FOUND);
		}
		return createResponse(Response.Status.OK, entity);
	}
	
	protected Response update(MainEntity entity) {
		Response response = null;

		try {
			validate(entity);
			getRegistration().register(entity);
			response = createResponse(Response.Status.OK);
		} catch (ConstraintViolationException ce) {
			// Handle bean validation issues
			response = createResponse(Response.Status.BAD_REQUEST, createViolationMap(ce));
		} catch (ValidationException e) {
			// Handle the unique constrain violation
			Map<String, String> responseObj = new HashMap<String, String>();

			responseObj.put("email", "Email taken");
			response = createResponse(Response.Status.CONFLICT, responseObj);
		} catch (Exception e) {
			// Handle generic exceptions
			Map<String, String> responseObj = new HashMap<String, String>();
			responseObj.put("error", e.getMessage());
			response = createResponse(Response.Status.BAD_REQUEST, responseObj);
		}

		return response;
	}
	
	protected Response create(MainEntity entity) {
		Response response = null;

		try {
			validate(entity);

			int id = getRegistration().register(entity);
			response = createResponse(Response.Status.OK, id);
		} catch (ConstraintViolationException ce) {
			// Handle bean validation issues
			response = createResponse(Response.Status.BAD_REQUEST, createViolationMap(ce));
		} catch (ValidationException e) {
			// Handle the unique constrain violation
			Map<String, String> responseObj = new HashMap<String, String>();

			responseObj.put("email", "Email taken");
			response = createResponse(Response.Status.CONFLICT, responseObj);
		} catch (Exception e) {
			// Handle generic exceptions
			Map<String, String> responseObj = new HashMap<String, String>();
			responseObj.put("error", e.getMessage());
			response = createResponse(Response.Status.BAD_REQUEST, responseObj);
		}

		return response;
	}
	

	protected Response delete(int id) {
		getRegistration().delete(id);
		return createResponse(Response.Status.OK);
	}

	private void validate(MainEntity entity)
			throws ConstraintViolationException, ValidationException {
		Set<ConstraintViolation<MainEntity>> violations = validator
				.validate(entity);

		if (!violations.isEmpty()) {
			throw new ConstraintViolationException(
					new HashSet<ConstraintViolation<?>>(violations));
		}

		// Check the uniqueness of the email address
		// if (emailAlreadyExists(territory.getEmail())) {
		// throw new ValidationException("Unique Email Violation");
		// }
	}
	
	public abstract TableRegistration getRegistration();
	public abstract TableRepository getRepository();


}
