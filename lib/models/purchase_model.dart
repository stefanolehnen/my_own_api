class ShoppingDetails {
  final String companyName;
  final String datetimePurchase;
  final int totalItems;
  final String paymentMethod;

  ShoppingDetails({
    required this.companyName,
    required this.datetimePurchase,
    required this.totalItems,
    required this.paymentMethod,
  });

  factory ShoppingDetails.fromJson(Map<String, dynamic> json) {
    return ShoppingDetails(
      companyName:
          json['company_name'] ?? 'Unknown', // Valor padrão se for null
      datetimePurchase: json['datetime_purchase'] ?? 'Unknown',
      totalItems: json['total_items'] ?? 0,
      paymentMethod: json['payment_method'] ?? 'Unknown',
    );
  }
}

class Product {
  final String name;
  final int code;
  final double quantity;
  final String unit;
  final double unitPrice;
  final double totalPrice;

  Product({
    required this.name,
    required this.code,
    required this.quantity,
    required this.unit,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['nome'] ?? 'Unnamed',
      code: int.tryParse(json['codigo'].toString()) ?? 0,
      quantity: double.tryParse(
              (json['quantidade'] ?? '0').toString().replaceAll(',', '.')) ??
          0.0,
      unit: json['unidade'] ?? 'Unknown',
      unitPrice: double.tryParse((json['valor_unitario'] ?? '0')
              .toString()
              .replaceAll(',', '.')) ??
          0.0,
      totalPrice: double.tryParse(
              (json['valor_total'] ?? '0').toString().replaceAll(',', '.')) ??
          0.0,
    );
  }
}
