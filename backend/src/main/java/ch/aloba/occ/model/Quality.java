package ch.aloba.occ.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


@Entity
public class Quality extends MainEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	//bi-directional many-to-one association to Qualityl10n
	@OneToMany(mappedBy="quality", cascade = CascadeType.ALL)
	private List<QualityL10n> qualityL10ns;

	public Quality() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<QualityL10n> getQualityL10ns() {
		return this.qualityL10ns;
	}

	public void setQualityL10n(List<QualityL10n> qualityL10ns) {
		this.qualityL10ns = qualityL10ns;
	}

	public QualityL10n addQualityL10n(QualityL10n qualityL10n) {
		qualityL10ns.add(qualityL10n);
		qualityL10n.setQuality(this);

		return qualityL10n;
	}

	public QualityL10n removeQualityl10n(QualityL10n qualityl10n) {
		qualityL10ns.remove(qualityl10n);
		qualityl10n.setQuality(null);

		return qualityl10n;
	}

}