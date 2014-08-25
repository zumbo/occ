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

import ch.aloba.occ.data.MintmarkRepository;
import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.model.Mintmark;
import ch.aloba.occ.service.MintmarkRegistration;
import ch.aloba.occ.service.TableRegistration;

@Path("/mintmark")
@RequestScoped
public class MintmarkRESTService extends MainRESTService {

	@Inject
	private MintmarkRepository mintmarkRepository;

	@Inject
	MintmarkRegistration mintmarkRegistration;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAll(@QueryParam("territory") Integer territoryId) {
		if (territoryId != null && territoryId > 0) {
			return super.listByTerritory(territoryId);
		}
		else {
			return super.listAll();
		}
	}

	@GET
	@Path("{id:[0-9]+}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response lookupById(@PathParam("id") int id) {
		return super.lookupById(id);
	}

	@PUT
	@Path("{id:[0-9]+}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response update(@PathParam("id") int id, Mintmark mintmark) {
		return super.update(mintmark);
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response create(Mintmark mintmark) {
		return super.create(mintmark);
	}

	@DELETE
	@Path("{id:[0-9]+}")
	public Response delete(@PathParam("id") int id) {
		return super.delete(id);
	}

	@Override
	public TableRepository getRepository() {
		return mintmarkRepository;
	}

	@Override
	public TableRegistration getRegistration() {
		return mintmarkRegistration;
	}

}
