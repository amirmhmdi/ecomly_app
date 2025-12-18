import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    this.street,
    this.apartment,
    this.city,
    this.postCode,
    this.country,
  });

  final String? street;
  final String? apartment;
  final String? city;
  final String? postCode;
  final String? country;

  bool get isEmpty =>
      street == null &&
      apartment == null &&
      city == null &&
      postCode == null &&
      country == null;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [street, apartment, city, postCode, country];

  const Address.empty()
    : street = "Test String",
      apartment = "Test String",
      city = "Test String",
      postCode = "Test String",
      country = "Test String";
}
