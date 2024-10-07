class CartModel {
  String? image;
  int? price;
  int? quantity;
  String? name;
  String? totalPrice;
  String? id;

  CartModel(
      {required this.image,
      required this.name,
      required this.id,
      required this.price,
      required this.totalPrice,
      required this.quantity});
}
