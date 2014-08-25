package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;


@Entity
public class Epoch extends MainEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private Integer endYear;

	private Integer startYear;

	private int territory;

	public Epoch() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getEndYear() {
		return this.endYear;
	}

	public void setEndYear(Integer endYear) {
		this.endYear = endYear;
	}

	public Integer getStartYear() {
		return this.startYear;
	}

	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}

	public int getTerritory() {
		return this.territory;
	}

	public void setTerritory(int territory) {
		this.territory = territory;
	}

}