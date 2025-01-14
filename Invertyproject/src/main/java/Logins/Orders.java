package Logins;

public class Orders {
	private int id;
	private int product_id;
	private int qunatity;
	private String date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Orders(int id, int product_id, int qunatity, String date) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.qunatity = qunatity;
		this.date = date;
	}
	

}
