class OrderRequest {
  final String userId;
  final List<Map<String, dynamic>> products;

  OrderRequest({required this.userId, required this.products});

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "products": products,
    };
  }
}

class OrderResponse {
  final String id;
  final String customer;
  final List<dynamic> items;
  final double totalAmount;
  final String paymentStatus;
  final String status;

  OrderResponse({
    required this.id,
    required this.customer,
    required this.items,
    required this.totalAmount,
    required this.paymentStatus,
    required this.status,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json["_id"],
      customer: json["customer"],
      items: json["items"],
      totalAmount: (json["totalAmount"] as num).toDouble(),
      paymentStatus: json["paymentStatus"],
      status: json["status"],
    );
  }
}
