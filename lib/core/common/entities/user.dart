import 'package:ecomly_app/core/common/entities/address.dart';
import 'package:ecomly_app/features/wishlist/domain/entities/wishlist_product.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.wishlist,
    this.address,
    this.phone,
  });

  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final List<WishlistProduct> wishlist;
  final Address? address;
  final String? phone;

  @override
  List<Object?> get props => [];

  const User.empty()
    : id = "Test User",
      name = "Test User",
      email = "Test User",
      isAdmin = true,
      wishlist = const [],
      address = null,
      phone = null;
}
