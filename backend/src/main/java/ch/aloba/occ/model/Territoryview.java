package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonProperty;

@Entity @IdClass(TerritoryviewId.class)
@NamedQuery(name="Territoryview.findAll", query="SELECT t FROM Territoryview t")
public class Territoryview implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;
	
	@Id
	private String language;

	private String name;
	
	private String iso3166;

	private boolean toplevel;

	@Id
	private boolean primary;

	public Territoryview() {
	}

	public int getId() {
		return this.id;
	}

	public String getName() {
		return this.name;
	}
	
	public String getLanguage() {
		return this.language;
	}

	@JsonProperty("isoCode")
	public String getIso3166() {
		return this.iso3166;
	}

	public boolean getToplevel() {
		return this.toplevel;
	}

	public boolean getPrimary() {
		return this.primary;
	}
	
	@Override
	public String toString() {
		return name;
	}
}

class TerritoryviewId implements Serializable {
	private static final long serialVersionUID = 1691145184289894628L;
	int id;
	String language;
	boolean primary;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result
				+ ((language == null) ? 0 : language.hashCode());
		result = prime * result + (primary ? 1231 : 1237);
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TerritoryviewId other = (TerritoryviewId) obj;
		if (id != other.id)
			return false;
		if (language == null) {
			if (other.language != null)
				return false;
		} else if (!language.equals(other.language))
			return false;
		if (primary != other.primary)
			return false;
		return true;
	}
}