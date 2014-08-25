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

import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.ReadViewEntity;
import ch.aloba.occ.model.ReadWriteViewEntity;
import ch.aloba.occ.service.ViewRegistration;

public abstract class ViewRESTService extends RESTService {
	protected Response listAll(String lang) {
		lang = initLang(lang);
		List<? extends ReadViewEntity> views = getRepository().findAllIncludingEn(lang);
		return createResponse(Response.Status.OK, views);
	}
	
	public Response listByTerritory(String lang, Integer territoryId) {
		List<? extends ReadViewEntity> entities = getRepository().findByTerritory(lang, territoryId);
		return createResponse(Response.Status.OK, entities);
	}

	
	protected Response lookupById(int id, String lang) {
		lang = initLang(lang);
		ReadViewEntity view = getRepository().findById(id, lang);
		if (view == null) {
			throw new WebApplicationException(Response.Status.NOT_FOUND);
		}
		return createResponse(Response.Status.OK, view);
	}
	
	protected Response update(int id, ReadWriteViewEntity viewEntity) {
		Response response = null;

		try {
			validate(viewEntity);

			getRegistration().updateTables(viewEntity);
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
	
	protected Response create(ReadWriteViewEntity viewEntity) {
		Response response = null;

		try {
			validate(viewEntity);

			int id = getRegistration().updateTables(viewEntity);
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

	private void validate(ReadWriteViewEntity viewEntity)
			throws ConstraintViolationException, ValidationException {
		Set<ConstraintViolation<ReadWriteViewEntity>> violations = validator
				.validate(viewEntity);

		if (!violations.isEmpty()) {
			throw new ConstraintViolationException(
					new HashSet<ConstraintViolation<?>>(violations));
		}

		// Check the uniqueness of the email address
		// if (emailAlreadyExists(territory.getEmail())) {
		// throw new ValidationException("Unique Email Violation");
		// }
	}
	
	public abstract ViewRegistration getRegistration();
	public abstract ViewRepository<? extends ReadViewEntity> getRepository();

}
