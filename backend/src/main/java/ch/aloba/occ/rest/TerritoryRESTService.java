package ch.aloba.occ.rest;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import ch.aloba.occ.data.TerritoryviewRepository;
import ch.aloba.occ.model.Territory;
import ch.aloba.occ.model.Territoryview;
import ch.aloba.occ.service.TerritoryRegistration;

@Path("/territory")
@RequestScoped
public class TerritoryRESTService extends RESTService {

    @Inject
    private TerritoryviewRepository repository;

    @Inject
    TerritoryRegistration registration;

   @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response listAllTerritories(@QueryParam("parent") Integer parent, @QueryParam("lang") String lang) {
	   lang = initLang(lang);
    	List<Territoryview> territories;
    	if (parent == null) {
    		territories = repository.findAll(lang);
    	}
    	else if (parent == 0) {
    		territories = repository.findTopLevel(lang);
    	}
    	else {
    		territories = repository.findRelated(parent, lang);
    	}
        
    	return createResponse(Response.Status.OK, territories);
    }

    @GET
    @Path("/{id:[0-9][0-9]*}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response lookupTerritoryById(@PathParam("id") int id, @QueryParam("lang") String lang) {
 	   lang = initLang(lang);
    	Territoryview territory = repository.findById(id, lang);
        if (territory == null) {
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }
    	return createResponse(Response.Status.OK, territory);
    }

    /**
     * Creates a new territory from the values provided. Performs validation, and will return a JAX-RS response with either 200 ok,
     * or with a map of fields, and related errors.
     */
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createTerritory(Territory territory) {

        Response response = null;

        try {
            // Validates territory using bean validation
            validateTerritory(territory);

            registration.register(territory);
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

    /**
     * <p>
     * Validates the given territory and throws validation exceptions based on the type of error. If the error is standard
     * bean validation errors then it will throw a ConstraintValidationException with the set of the constraints violated.
     * </p>
     * 
     * @param territory Territory to be validated
     * @throws ConstraintViolationException If Bean Validation errors exist
     * @throws ValidationException If territory with the same email already exists
     */
    private void validateTerritory(Territory territory) throws ConstraintViolationException, ValidationException {
        // Create a bean validator and check for issues.
        Set<ConstraintViolation<Territory>> violations = validator.validate(territory);

        if (!violations.isEmpty()) {
            throw new ConstraintViolationException(new HashSet<ConstraintViolation<?>>(violations));
        }

        // Check the uniqueness of the email address
//        if (emailAlreadyExists(territory.getEmail())) {
//            throw new ValidationException("Unique Email Violation");
//        }
    }
}
