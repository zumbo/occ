package ch.aloba.occ.model;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@NamedQuery(name="Continent.findAll", query="SELECT c FROM Continent c")
public class Continent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String name;

	public Continent() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}