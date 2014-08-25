package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;
import java.util.Set;


@Entity
@NamedQuery(name="Territory.findAll", query="SELECT t FROM Territory t")
public class Territory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int fictional;

	private String iso3166;

	private int toplevel;

	//bi-directional many-to-one association to Continent
	@ManyToOne
	@JoinColumn(name="continent")
	private Continent continent;

	//bi-directional many-to-one association to Territoryname
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="territory")
	private List<Territoryname> territorynames;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="sourceterritory")
	private Set<Territoryrelation> sourceterritoryrelations;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="targetterritory")
	private Set<Territoryrelation> targetterritoryrelations;

	public Territory() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@JsonProperty("name")
	public String getLocalName() {
		Territoryname name = getTerritoryname("en");
		if (name == null) {
			return "";
		}
		return name.getName(); 
	}
	
	private Territoryname getTerritoryname(String language) {
		if (territorynames == null) {
			return null;
		}
		for (Territoryname name : territorynames) {
			if (name.getLanguage() != null && name.getLanguage().equals(language)) {
				return name;
			}
		}
		return null;
	}

	public int getFictional() {
		return this.fictional;
	}

	public void setFictional(int fictional) {
		this.fictional = fictional;
	}

	@JsonProperty("isoCode")
	public String getIso3166() {
		return this.iso3166;
	}

	public void setIso3166(String iso3166) {
		this.iso3166 = iso3166;
	}

	public int getToplevel() {
		return this.toplevel;
	}

	public void setToplevel(int toplevel) {
		this.toplevel = toplevel;
	}

	public Continent getContinent() {
		return this.continent;
	}

	public void setContinent(Continent continent) {
		this.continent = continent;
	}

	public List<Territoryname> getTerritorynames() {
		return this.territorynames;
	}

	public void setTerritorynames(List<Territoryname> territorynames) {
		this.territorynames = territorynames;
	}

	public Territoryname addTerritoryname(Territoryname territoryname) {
		getTerritorynames().add(territoryname);

		return territoryname;
	}

	public Territoryname removeTerritoryname(Territoryname territoryname) {
		getTerritorynames().remove(territoryname);

		return territoryname;
	}

	@JsonIgnore
	public Set<Territoryrelation> getSourceterritoryrelations() {
		return this.sourceterritoryrelations;
	}

	public void setSourceterritoryrelations(Set<Territoryrelation> sourceterritoryrelations) {
		this.sourceterritoryrelations = sourceterritoryrelations;
	}

	public Territoryrelation addSourceterritoryrelations(Territoryrelation sourceterritoryrelations) {
		getSourceterritoryrelations().add(sourceterritoryrelations);

		return sourceterritoryrelations;
	}

	public Territoryrelation removeSourceterritoryrelations(Territoryrelation sourceterritoryrelations) {
		getSourceterritoryrelations().remove(sourceterritoryrelations);

		return sourceterritoryrelations;
	}

	@JsonIgnore
	public Set<Territoryrelation> getTargetterritoryrelations() {
		return this.targetterritoryrelations;
	}

	public void setTargetterritoryrelations(Set<Territoryrelation> targetterritoryrelations) {
		this.targetterritoryrelations = targetterritoryrelations;
	}

	public Territoryrelation addTargetterritoryrelations(Territoryrelation targetterritoryrelation) {
		getTargetterritoryrelations().add(targetterritoryrelation);

		return targetterritoryrelation;
	}

	public Territoryrelation removeTargetterritoryrelations(Territoryrelation targetterritoryrelation) {
		getTargetterritoryrelations().remove(targetterritoryrelation);

		return targetterritoryrelation;
	}

}