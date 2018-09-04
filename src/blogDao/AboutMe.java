package blogDao;

public class AboutMe {
	private String text;
	private String id;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AboutMe(String text, String id) {
		this.text = text;
		this.id = id;
	}

	public AboutMe() {
	}

}
