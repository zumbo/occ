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

import ch.aloba.occ.data.QualityviewRepository;
import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.Qualityview;
import ch.aloba.occ.model.ReadViewEntity;
import ch.aloba.occ.service.QualityViewRegistration;
import ch.aloba.occ.service.ViewRegistration;

@Path("/quality")
@RequestScoped
public class QualityRESTService extends ViewRESTService {

	@Inject
	private QualityviewRepository qualityviewRepository;

	@Inject
	QualityViewRegistration qualityviewRegistration;

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
	public Response updateQuality(@PathParam("id") int id, Qualityview quality) {
		return super.update(id, quality);
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response create(Qualityview qualityview) {
		return super.create(qualityview);
	}

	@DELETE
	@Path("{id:[0-9]+}")
	public Response delete(@PathParam("id") int id) {
		return super.delete(id);
	}

	@Override
	public ViewRepository<? extends ReadViewEntity> getRepository() {
		return qualityviewRepository;
	}

	@Override
	public ViewRegistration getRegistration() {
		return qualityviewRegistration;
	}

}
