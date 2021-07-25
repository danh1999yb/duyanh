package Exercise1;

public class News implements INews {
	int id;
	String tittle;
	String PublishDate;
	String Author;
	String Content;
	float AverageRate;
	private int[] rates;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the tittle
	 */
	public String getTittle() {
		return tittle;
	}

	/**
	 * @param tittle the tittle to set
	 */
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	/**
	 * @return the publishDate
	 */
	public String getPublishDate() {
		return PublishDate;
	}

	/**
	 * @param publishDate the publishDate to set
	 */
	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return Author;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		Author = author;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return Content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		Content = content;
	}

	/**
	 * @return the averageRate
	 */
	public float getAverageRate() {
		return AverageRate;
	}

	/**
	 * @return the rate
	 */
	public int[] getRates() {
		return rates;
	}

	/**
	 * @param rate the rate to set
	 */
	public void setRates(int[] rates) {
		this.rates = rates;
	}

	public News(int id, String tittle, String publishDate, String author, String content, float averageRate) {
		super();
		this.id = id;
		this.tittle = tittle;
		PublishDate = publishDate;
		Author = author;
		Content = content;
		AverageRate = averageRate;
		this.rates = rates;
	}

	public News(String title, String publishDate2, String author2, String content2, int[] rates2) {
		// TODO Auto-generated constructor stub
	}

	public void display() {
		System.out.println("News [title=" + tittle + ", publishDate=" +

				PublishDate + ", author=" + Author + "]");
	}

	public float calculate() {
		AverageRate = (float) ((rates[0] + rates[1] + rates[2]) / 3);
		return AverageRate;
	}

	public String getTitle() {
		// TODO Auto-generated method stub
		return null;
	}
	
}

