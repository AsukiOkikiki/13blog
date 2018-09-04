package blogDao;

public class BlogInfo {
	private String id;
	private String title;
	private String text;
	private String type;
	private String author;
	private String time;
	private int visited;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getVisited() {
		return visited;
	}

	public void setVisited(int visited) {
		this.visited = visited;
	}

	public BlogInfo(String id, String title, String text, String type, String author, String time, int visited) {
		this.title = title;
		this.text = text;
		this.type = type;
		this.author = author;
		this.time = time;
		this.visited = visited;
	}

	@Override
	public String toString() {
		return "BlogInfo [id=" + id + ", title=" + title + ", text=" + text + ", type=" + type + ", author=" + author
				+ ", time=" + time + ", visited=" + visited + "]";
	}

	public BlogInfo() {
	}
}
