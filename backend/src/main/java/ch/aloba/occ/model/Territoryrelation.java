package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@IdClass(TerritoryrelationId.class)
@NamedQuery(name = "Territoryrelation.findAll", query = "SELECT t FROM Territoryrelation t")
public class Territoryrelation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int sourceterritory;

	@Id
	private int targetterritory;

	@Id
	private int relationtype;

	public Territoryrelation() {
	}

	public int getSourceterritory() {
		return sourceterritory;
	}

	public int getTargetterritory() {
		return targetterritory;
	}

	public int getRelationtype() {
		return relationtype;
	}
}

class TerritoryrelationId implements Serializable {
	private static final long serialVersionUID = 6461299332949614750L;

	private int sourceterritory;
	private int targetterritory;
	private int relationtype;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + relationtype;
		result = prime * result + sourceterritory;
		result = prime * result + targetterritory;
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
		TerritoryrelationId other = (TerritoryrelationId) obj;
		if (relationtype != other.relationtype)
			return false;
		if (sourceterritory != other.sourceterritory)
			return false;
		if (targetterritory != other.targetterritory)
			return false;
		return true;
	}
}