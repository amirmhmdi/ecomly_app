import 'dart:convert';

import 'package:ecomly_app/core/common/entities/address.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';

class AddressModel extends Address {
  const AddressModel({
    super.street,
    super.apartment,
    super.city,
    super.postCode,
    super.country,
  });

  factory AddressModel.formJson(String source) {
    return AddressModel.fromMap(jsonDecode(source) as DataMap);
  }

  String toJson() => jsonEncode(toMap());

  DataMap toMap() {
    return {
      'street': super.street,
      'apartment': super.apartment,
      'city': super.city,
      'postCode': super.postCode,
      'country': super.country,
    };
  }

  factory AddressModel.fromMap(DataMap map) {
    return AddressModel(
      street: map['street'] as String,
      apartment: map['apartment'] as String,
      city: map['city'] as String,
      postCode: map['postCode'] as String,
      country: map['country'] as String,
    );
  }

  AddressModel copyWith({
    String? street,
    String? apartment,
    String? city,
    String? postCode,
    String? country,
  }) {
    return AddressModel(
      street: street ?? super.street,
      apartment: apartment ?? super.apartment,
      city: city ?? super.city,
      postCode: postCode ?? super.postCode,
      country: country ?? super.country,
    );
  }

  const AddressModel.empty()
    : this(
        street: "Test String",
        apartment: "Test String",
        city: "Test String",
        postCode: "Test String",
        country: "Test String",
      );
}
