import 'dart:convert';

import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/wishlist/domain/entities/wishlist_product.dart';

class WishlistProductModel extends WishlistProduct {
  const WishlistProductModel({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.productPrice,
    required super.productExist,
    required super.productOutOfStock,
  });

  factory WishlistProductModel.fromJson(String source) =>
      WishlistProductModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  DataMap toMap() {
    return {
      'productId': super.productId,
      'productName': super.productName,
      'productImage': super.productImage,
      'productPrice': super.productPrice,
      'productExist': super.productExist,
      'productOutOfStock': super.productOutOfStock,
    };
  }

  WishlistProductModel.fromMap(DataMap map)
    : this(
        productId: map['productId'] as String,
        productName: map['productName'] as String,
        productImage: map['productImage'] as String,
        productPrice: map['productPrice'] as double,
        productExist: map['productExist'] as bool,
        productOutOfStock: map['productOutOfStock'] as bool,
      );

  WishlistProductModel copyWith({
    String? productId,
    String? productName,
    String? productImage,
    double? productPrice,
    bool? productExist,
    bool? productOutOfStock,
  }) {
    return WishlistProductModel(
      productId: productId ?? super.productId,
      productName: productName ?? super.productName,
      productImage: productImage ?? super.productImage,
      productPrice: productPrice ?? super.productPrice,
      productExist: productExist ?? super.productExist,
      productOutOfStock: productOutOfStock ?? super.productOutOfStock,
    );
  }

  const WishlistProductModel.empty()
    : this(
        productId: "test String",
        productName: "test String",
        productImage: "test String",
        productPrice: 1.0,
        productExist: true,
        productOutOfStock: true,
      );
}
