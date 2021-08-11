class ErrorDto {

  int? statusCode;
  String? id;
  String? message;
  String? requestId;

  ErrorDto({
    this.statusCode,
    this.id,
    this.message,
    this.requestId,
  });

  ErrorDto copyWith({
    int? statusCode,
    String? id,
    String? message,
    String? requestId,
  }) {
    return new ErrorDto(
      statusCode: statusCode ?? this.statusCode,
      id: id ?? this.id,
      message: message ?? this.message,
      requestId: requestId ?? this.requestId,
    );
  }

  @override
  String toString() {
    return 'ErrorDto{statusCode: $statusCode, id: $id, message: $message, requestId: $requestId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErrorDto &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode &&
          id == other.id &&
          message == other.message &&
          requestId == other.requestId);

  @override
  int get hashCode =>
      statusCode.hashCode ^ id.hashCode ^ message.hashCode ^ requestId.hashCode;

  factory ErrorDto.fromMap(Map<String, dynamic> map) {
    return new ErrorDto(
      statusCode: map['status_code'] as int?,
      id: map['id'] as String?,
      message: map['message'] as String?,
      requestId: map['request_id'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status_code': this.statusCode,
      'id': this.id,
      'message': this.message,
      'request_id': this.requestId,
    };
  }

  ErrorDto.fromJson(Map<String, dynamic> json)
      : statusCode = json['status_code'],
        id = json['id'],
        message = json['message'],
        requestId = json['request_id'];

  Map<String, dynamic> toJson() => {
    'status_code': statusCode,
    'id': id,
    'message': message,
    'request_id': requestId
  };

}