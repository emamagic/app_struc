class UserDto {
  String? uid;
  String? username;
  String? firstName;
  String? lastName;
  String? id;
  String? locale;
  String? position;
  String? nickname;
  String? phoneNumber;
  String? avatarHash;
  int? createAt;
  int? updateAt;
  int? deleteAt;
  String? email;
  bool? emailVerified;
  bool? isBot;
  String? lastAvatarUpdateTime;

  UserDto({
    required this.uid,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.locale,
    required this.position,
    required this.nickname,
    required this.phoneNumber,
    required this.avatarHash,
    required this.createAt,
    required this.updateAt,
    required this.deleteAt,
    required this.email,
    required this.emailVerified,
    required this.isBot,
    required this.lastAvatarUpdateTime,
  });

  UserDto copyWith({
    String? uid,
    String? username,
    String? firstName,
    String? lastName,
    String? id,
    String? locale,
    String? position,
    String? nickname,
    String? phoneNumber,
    String? avatarHash,
    int? createAt,
    int? updateAt,
    int? deleteAt,
    String? email,
    bool? emailVerified,
    bool? isBot,
    String? lastAvatarUpdateTime,
  }) {
    return new UserDto(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      id: id ?? this.id,
      locale: locale ?? this.locale,
      position: position ?? this.position,
      nickname: nickname ?? this.nickname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarHash: avatarHash ?? this.avatarHash,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      deleteAt: deleteAt ?? this.deleteAt,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      isBot: isBot ?? this.isBot,
      lastAvatarUpdateTime: lastAvatarUpdateTime ?? this.lastAvatarUpdateTime,
    );
  }

  @override
  String toString() {
    return 'UserDto{uid: $uid, username: $username, firstName: $firstName, lastName: $lastName, id: $id, locale: $locale, position: $position, nickname: $nickname, phoneNumber: $phoneNumber, avatarHash: $avatarHash, createAt: $createAt, updateAt: $updateAt, deleteAt: $deleteAt, email: $email, emailVerified: $emailVerified, isBot: $isBot, lastAvatarUpdateTime: $lastAvatarUpdateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDto &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          username == other.username &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          id == other.id &&
          locale == other.locale &&
          position == other.position &&
          nickname == other.nickname &&
          phoneNumber == other.phoneNumber &&
          avatarHash == other.avatarHash &&
          createAt == other.createAt &&
          updateAt == other.updateAt &&
          deleteAt == other.deleteAt &&
          email == other.email &&
          emailVerified == other.emailVerified &&
          isBot == other.isBot &&
          lastAvatarUpdateTime == other.lastAvatarUpdateTime);

  @override
  int get hashCode =>
      uid.hashCode ^
      username.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      id.hashCode ^
      locale.hashCode ^
      position.hashCode ^
      nickname.hashCode ^
      phoneNumber.hashCode ^
      avatarHash.hashCode ^
      createAt.hashCode ^
      updateAt.hashCode ^
      deleteAt.hashCode ^
      email.hashCode ^
      emailVerified.hashCode ^
      isBot.hashCode ^
      lastAvatarUpdateTime.hashCode;

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return new UserDto(
      uid: map['uid'] as String?,
      username: map['username'] as String?,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      id: map['id'] as String?,
      locale: map['locale'] as String?,
      position: map['position'] as String?,
      nickname: map['nickname'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      avatarHash: map['avatarHash'] as String?,
      createAt: map['createAt'] as int?,
      updateAt: map['updateAt'] as int?,
      deleteAt: map['deleteAt'] as int?,
      email: map['email'] as String?,
      emailVerified: map['emailVerified'] as bool?,
      isBot: map['isBot'] as bool?,
      lastAvatarUpdateTime: map['lastAvatarUpdateTime'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'username': this.username,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'id': this.id,
      'locale': this.locale,
      'position': this.position,
      'nickname': this.nickname,
      'phoneNumber': this.phoneNumber,
      'avatarHash': this.avatarHash,
      'createAt': this.createAt,
      'updateAt': this.updateAt,
      'deleteAt': this.deleteAt,
      'email': this.email,
      'emailVerified': this.emailVerified,
      'isBot': this.isBot,
      'lastAvatarUpdateTime': this.lastAvatarUpdateTime,
    };
  }

  UserDto.fromJson(dynamic json) {
    uid = json['uid'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    id = json['id'];
    locale = json['locale'];
    position = json['position'];
    nickname = json['nickname'];
    phoneNumber = json['phone_number'];
    avatarHash = json['avatar_hash'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    deleteAt = json['delete_at'];
    email = json['email'];
    emailVerified = json['email_verified'];
    isBot = json['is_bot'];
    lastAvatarUpdateTime = json['last_avatar_update_time'];

    Map<String, dynamic> toJson() {
      var map = <String, dynamic>{};
      map['uid'] = uid;
      map['username'] = username;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      map['id'] = id;
      map['locale'] = locale;
      map['position'] = position;
      map['nickname'] = nickname;
      map['phone_number'] = phoneNumber;
      map['avatar_hash'] = avatarHash;
      map['create_at'] = createAt;
      map['update_at'] = updateAt;
      map['delete_at'] = deleteAt;
      map['email'] = email;
      map['email_verified'] = emailVerified;
      map['is_bot'] = isBot;
      map['last_avatar_update_time'] = lastAvatarUpdateTime;
      return map;
    }
  }
}
