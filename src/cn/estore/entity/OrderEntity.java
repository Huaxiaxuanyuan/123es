package cn.estore.entity;

public class OrderEntity {
	private String orderId; /*订单的详细编号:用户名-日期时间组成，形成admin-2012-10-03-08：24：31*/
	private String name;/*订单的用户 */
	private String realName;/*用户的真名reallyName->real_name */
	private String address;/*送货地址 */
	private String mobile;/*用户手机号 tel->mobile*/
	private float totalPrice;/* 订单总金额 setMoney->total_amount->total_price*/
	private String deliveryMethod;/* 寄送方式 post->delivery_method*/
	private String memo;/* 备注 bz->memo*/
	private Boolean deliverySign=false;/*是否已经发货delivery_sign 默认新生成订单没发货*/
	private String createTime;/* 订单生成时间*/
	private String paymentMode;/*新增列，存放支付方式,文本类型*/
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Boolean getDeliverySign() {
		return deliverySign;
	}
	public void setDeliverySign(Boolean deliverySign) {
		this.deliverySign = deliverySign;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public OrderEntity(String orderId, String name, String realName, String address, String mobile, float totalPrice,
			String deliveryMethod, String memo, Boolean deliverySign, String createTime, String paymentMode) {
		super();
		this.orderId = orderId;
		this.name = name;
		this.realName = realName;
		this.address = address;
		this.mobile = mobile;
		this.totalPrice = totalPrice;
		this.deliveryMethod = deliveryMethod;
		this.memo = memo;
		this.deliverySign = deliverySign;
		this.createTime = createTime;
		this.paymentMode = paymentMode;
	}
	public OrderEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OrderEntity [orderId=" + orderId + ", name=" + name + ", realName=" + realName + ", address=" + address
				+ ", mobile=" + mobile + ", totalPrice=" + totalPrice + ", deliveryMethod=" + deliveryMethod + ", memo="
				+ memo + ", deliverySign=" + deliverySign + ", createTime=" + createTime + ", paymentMode="
				+ paymentMode + "]";
	}
	
	
}
