package cn.estore.entity;

public class OrderItemEntity {
	private int id;/*自增编号*/
	private String orderId;/* 所属订单编号 orderNumber->order_number->order_id 外键 */
	private int productId;/*订单中商品的编号goodId->product_id*/
	private String productName; /*商品名*/
	private float productPrice;/*订购的商品价格price->product_price*/
	private int amount;/*订购商品数量number->amount*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public OrderItemEntity(int id, String orderId, int productId, String productName, float productPrice, int amount) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.amount = amount;
	}
	public OrderItemEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OrderItemEntity [id=" + id + ", orderId=" + orderId + ", productId=" + productId + ", productName="
				+ productName + ", productPrice=" + productPrice + ", amount=" + amount + "]";
	}
	
	
}
