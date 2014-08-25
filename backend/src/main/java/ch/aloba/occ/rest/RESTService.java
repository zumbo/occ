package ch.aloba.occ.rest;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validator;
import javax.ws.rs.OPTIONS;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

public abstract class RESTService {
	@Inject
	protected Logger log;

	@Inject
	protected Validator validator;
	
    @OPTIONS
    public Response getOptions() {
    	return createResponse(Response.Status.OK);
    }

    @OPTIONS
    @Path("{path:.*}")
    public Response getPathOptions(@PathParam("path") String path) {
    	return getOptions();
    }

    protected Response createResponse(Response.Status status) {
    	return createResponse(status, null);
    }
    
	protected Response createResponse(Response.Status status, Object data) {
		Response.ResponseBuilder builder = Response.status(status);
		
		builder.header("Access-Control-Allow-Origin", "http://localhost:9000"); 
		builder.header("Access-Control-Allow-Credentials", "true");
		builder.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
		builder.header("Access-Control-Allow-Headers", "Content-Type");
//		builder.header("Access-Control-Allow-Headers", "Referer, User-Agent, Origin, X-Requested-With, Content-Type, Accept, Authorization");
		if (data != null) {
			builder.entity(data);
		}
		return builder.build();
	}
	
	protected Map<String, String> createViolationMap(ConstraintViolationException ce) {
		Set<ConstraintViolation<?>> violations = ce.getConstraintViolations();
		log.fine("Validation completed. violations found: " + violations.size());

		Map<String, String> responseObj = new HashMap<String, String>();

		for (ConstraintViolation<?> violation : violations) {
			responseObj.put(violation.getPropertyPath().toString(),
					violation.getMessage());
		}

		return responseObj;
	}
	
	protected static String initLang(String lang) {
		if (lang == null || lang.isEmpty()) {
    		lang = "en";
    	}
		return lang;
	}
}
