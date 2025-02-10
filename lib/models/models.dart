class Category {
  final String id;
  final String title;
  final String image;
  final bool isSelected;

  Category({
    required this.id,
    required this.title,
    required this.image,
    required this.isSelected,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      isSelected: json['isSelected'],
    );
  }
}

class Product {
  final String id;
  final double price;
  final int discountPrice;
  final String title;
  final int quantity;
  final int maxQuantity;
  final List<String> images;

  Product({
    required this.id,
    required this.price,
    required this.discountPrice,
    required this.title,
    required this.quantity,
    required this.maxQuantity,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      price: (json['price'] as num).toDouble() / 100,
      discountPrice: json['discountPrice'],
      title: json['title'],
      quantity: json['quantity'],
      maxQuantity: json['maxQuantity'],
      images: List<String>.from(json['image'].map((img) => img['url'])),
    );
  }
}
