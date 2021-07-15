package cn.estore.cart;

public class CartGoods {
	
	public int ID;
	public float price;
	public int number;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "CartGoods [ID=" + ID + ", price=" + price + ", number=" + number + "]";
	}
	public CartGoods(int iD, float price, int number) {
		super();
		ID = iD;
		this.price = price;
		this.number = number;
	}
	public CartGoods() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
