package ch.aloba.occ.model;

import java.io.Serializable;

public class L10nViewId implements Serializable {
	private static final long serialVersionUID = -1L;
	public L10nViewId() {}
	public L10nViewId(int id, String language) {
		this.id = id;
		this.language = language;
	}
	int id;
	String language;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result
				+ ((language == null) ? 0 : language.hashCode());
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
		L10nViewId other = (L10nViewId) obj;
		if (id != other.id)
			return false;
		if (language == null) {
			if (other.language != null)
				return false;
		} else if (!language.equals(other.language))
			return false;
		return true;
	}
}