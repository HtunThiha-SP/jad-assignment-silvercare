package model;

public class ServiceCategory {
	private String name;
	private String description;
	private int imgIndex;
	
	public ServiceCategory(String name, String description, int imgIndex) {
		super();
		this.name = name;
		this.description = description;
		this.imgIndex = imgIndex;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getImgIndex() {
		return imgIndex;
	}

	public void setImgIndex(int imgIndex) {
		this.imgIndex = imgIndex;
	}
}
