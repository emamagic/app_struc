class PhoneNumberDto {
  late String phoneNumber;

   PhoneNumberDto({
    required this.phoneNumber,
  });

   PhoneNumberDto copyWith({
    required String phoneNumber,
  }) {
    return new PhoneNumberDto(
      phoneNumber: phoneNumber,
    );
  }

   @override
  String toString() {
    return 'PhoneNumberDto{phoneNumber: $phoneNumber}';
  }

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhoneNumberDto &&
          runtimeType == other.runtimeType &&
          phoneNumber == other.phoneNumber);

   @override
  int get hashCode => phoneNumber.hashCode;

   factory PhoneNumberDto.fromMap(Map<String, dynamic> map) {
    return new PhoneNumberDto(
      phoneNumber: map['phoneNumber'] as String,
    );
  }

   Map<String, dynamic> toMap() {
    return {'phoneNumber': this.phoneNumber,};
  }

   PhoneNumberDto.fromJson(Map<String, dynamic> json)
       : phoneNumber = json['phone_number'];

   Map<String, dynamic> toJson() => {'phone_number': phoneNumber};


}