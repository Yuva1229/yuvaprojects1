package Logins;

public class Shipmentdata {
	private int id;
	private int product_id;
	private int qunatity;
	private String data;
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
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public Shipmentdata(int id, int product_id, int qunatity, String data) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.qunatity = qunatity;
		this.data = data;
	}
	

}
