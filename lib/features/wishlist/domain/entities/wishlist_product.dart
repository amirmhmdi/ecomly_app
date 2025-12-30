import 'package:equatable/equatable.dart';

class WishlistProduct extends Equatable {
  const WishlistProduct({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productExist,
    required this.productOutOfStock,
  });

  final String productId;
  final String productName;
  final String productImage;
  final double productPrice;
  final bool productExist;
  final bool productOutOfStock;

  const WishlistProduct.empty()
    : productId = "test String",
      productName = "test String",
      productImage = "test String",
      productPrice = 1.0,
      productExist = true,
      productOutOfStock = true;

  @override
  List<Object?> get props => [
    productId,
    productName,
    productImage,
    productPrice,
    productExist,
    productOutOfStock,
  ];
}
