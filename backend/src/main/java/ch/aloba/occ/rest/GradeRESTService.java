package ch.aloba.occ.rest;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import ch.aloba.occ.data.GradeviewRepository;
import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.Gradeview;
import ch.aloba.occ.model.ReadViewEntity;
import ch.aloba.occ.service.GradeViewRegistration;
import ch.aloba.occ.service.ViewRegistration;

@Path("/grade")
@RequestScoped
public class GradeRESTService extends ViewRESTService {

	@Inject
	private GradeviewRepository gradeviewRepository;

	@Inject
	GradeViewRegistration gradeviewRegistration;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAll(@QueryParam("lang") String lang) {
		return super.listAll(lang);
	}

	@GET
	@Path("{id:[0-9]+}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response lookupById(@PathParam("id") int id,
			@QueryParam("lang") String lang) {
		return super.lookupById(id, lang);
	}

	@PUT
	@Path("{id:[0-9]+}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updateGrade(@PathParam("id") int id, Gradeview grade) {
		return super.update(id, grade);
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response create(Gradeview gradeview) {
		return super.create(gradeview);
	}

	@DELETE
	@Path("{id:[0-9]+}")
	public Response delete(@PathParam("id") int id) {
		return super.delete(id);
	}

	@Override
	public ViewRepository<? extends ReadViewEntity> getRepository() {
		return gradeviewRepository;
	}

	@Override
	public ViewRegistration getRegistration() {
		return gradeviewRegistration;
	}

}
