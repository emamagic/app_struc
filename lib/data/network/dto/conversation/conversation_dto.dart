class ConversationDto {
  String? _id;
  int? _createAt;
  int? _updateAt;
  int? _deleteAt;
  String? _workspaceId;
  String? _type;
  String? _displayName;
  String? _header;
  String? _purpose;
  int? _totalMsgCount;
  String? _creatorId;
  String? _iconHash;
  bool? _archived;
  String? _directUserId;
  int? _directUserLastSeenAt;
  // My_membership? _myMembership;

  String? get id => _id;
  int? get createAt => _createAt;
  int? get updateAt => _updateAt;
  int? get deleteAt => _deleteAt;
  String? get workspaceId => _workspaceId;
  String? get type => _type;
  String? get displayName => _displayName;
  String? get header => _header;
  String? get purpose => _purpose;
  int? get totalMsgCount => _totalMsgCount;
  String? get creatorId => _creatorId;
  String? get iconHash => _iconHash;
  bool? get archived => _archived;
  String? get directUserId => _directUserId;
  int? get directUserLastSeenAt => _directUserLastSeenAt;
  // My_membership? get myMembership => _myMembership;

  ConversationDto({
      String? id, 
      int? createAt, 
      int? updateAt, 
      int? deleteAt, 
      String? workspaceId, 
      String? type, 
      String? displayName, 
      String? header, 
      String? purpose, 
      int? totalMsgCount, 
      String? creatorId, 
      String? iconHash, 
      bool? archived, 
      String? directUserId, 
      int? directUserLastSeenAt, 
      My_membership? myMembership}){
    _id = id;
    _createAt = createAt;
    _updateAt = updateAt;
    _deleteAt = deleteAt;
    _workspaceId = workspaceId;
    _type = type;
    _displayName = displayName;
    _header = header;
    _purpose = purpose;
    _totalMsgCount = totalMsgCount;
    _creatorId = creatorId;
    _iconHash = iconHash;
    _archived = archived;
    _directUserId = directUserId;
    _directUserLastSeenAt = directUserLastSeenAt;
    // _myMembership = myMembership;
}

  ConversationDto.fromJson(dynamic json) {
    _id = json['id'];
    _createAt = json['create_at'];
    _updateAt = json['update_at'];
    _deleteAt = json['delete_at'];
    _workspaceId = json['workspace_id'];
    _type = json['type'];
    _displayName = json['display_name'];
    _header = json['header'];
    _purpose = json['purpose'];
    _totalMsgCount = json['total_msg_count'];
    _creatorId = json['creator_id'];
    _iconHash = json['icon_hash'];
    _archived = json['archived'];
    _directUserId = json['direct_user_id'];
    _directUserLastSeenAt = json['direct_user_last_seen_at'];
    // _myMembership = json['my_membership'] != null ? My_membership.fromJson(json['myMembership']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['create_at'] = _createAt;
    map['update_at'] = _updateAt;
    map['delete_at'] = _deleteAt;
    map['workspace_id'] = _workspaceId;
    map['type'] = _type;
    map['display_name'] = _displayName;
    map['header'] = _header;
    map['purpose'] = _purpose;
    map['total_msg_count'] = _totalMsgCount;
    map['creator_id'] = _creatorId;
    map['icon_hash'] = _iconHash;
    map['archived'] = _archived;
    map['direct_user_id'] = _directUserId;
    map['direct_user_last_seen_at'] = _directUserLastSeenAt;
    // if (_myMembership != null) {
    //   map['my_membership'] = _myMembership?.toJson();
    // }
    return map;
  }

}


class My_membership {
  String? _workspaceId;
  String? _conversationId;
  String? _userId;
  List<String>? _roles;
  int? _lastViewedAt;
  int? _msgCount;
  int? _mentionCount;
  Notify_props? _notifyProps;
  int? _lastUpdateAt;

  String? get workspaceId => _workspaceId;
  String? get conversationId => _conversationId;
  String? get userId => _userId;
  List<String>? get roles => _roles;
  int? get lastViewedAt => _lastViewedAt;
  int? get msgCount => _msgCount;
  int? get mentionCount => _mentionCount;
  Notify_props? get notifyProps => _notifyProps;
  int? get lastUpdateAt => _lastUpdateAt;

  My_membership({
      String? workspaceId, 
      String? conversationId, 
      String? userId, 
      List<String>? roles, 
      int? lastViewedAt, 
      int? msgCount, 
      int? mentionCount, 
      Notify_props? notifyProps, 
      int? lastUpdateAt}){
    _workspaceId = workspaceId;
    _conversationId = conversationId;
    _userId = userId;
    _roles = roles;
    _lastViewedAt = lastViewedAt;
    _msgCount = msgCount;
    _mentionCount = mentionCount;
    _notifyProps = notifyProps;
    _lastUpdateAt = lastUpdateAt;
}

  My_membership.fromJson(dynamic json) {
    _workspaceId = json['workspace_id'];
    _conversationId = json['conversation_id'];
    _userId = json['user_id'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _lastViewedAt = json['last_viewed_at'];
    _msgCount = json['msg_count'];
    _mentionCount = json['mention_count'];
    _notifyProps = json['notify_props'] != null ? Notify_props.fromJson(json['notifyProps']) : null;
    _lastUpdateAt = json['last_update_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['workspace_id'] = _workspaceId;
    map['conversation_id'] = _conversationId;
    map['user_id'] = _userId;
    map['roles'] = _roles;
    map['last_viewed_at'] = _lastViewedAt;
    map['msg_count'] = _msgCount;
    map['mention_count'] = _mentionCount;
    if (_notifyProps != null) {
      map['notify_props'] = _notifyProps?.toJson();
    }
    map['last_update_at'] = _lastUpdateAt;
    return map;
  }

}


class Notify_props {
  String? _email;
  String? _push;
  String? _desktop;
  String? _markUnread;

  String? get email => _email;
  String? get push => _push;
  String? get desktop => _desktop;
  String? get markUnread => _markUnread;

  Notify_props({
      String? email, 
      String? push, 
      String? desktop, 
      String? markUnread}){
    _email = email;
    _push = push;
    _desktop = desktop;
    _markUnread = markUnread;
}

  Notify_props.fromJson(dynamic json) {
    _email = json['email'];
    _push = json['push'];
    _desktop = json['desktop'];
    _markUnread = json['mark_unread'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['email'] = _email;
    map['push'] = _push;
    map['desktop'] = _desktop;
    map['mark_unread'] = _markUnread;
    return map;
  }

}