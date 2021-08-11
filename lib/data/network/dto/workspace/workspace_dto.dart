class WorkspaceDto {
  String? _id;
  String? _name;
  String? _displayName;
  String? _description;
  String? _iconHash;
  int? _createAt;
  String? _defaultConversationId;
  String? _organizationId;
  String? _timelineConversationId;
  bool? _isInvitation;
  // My_membership? _myMembership;
  // Worker_node? _workerNode;

  String? get id => _id;
  String? get name => _name;
  String? get displayName => _displayName;
  String? get description => _description;
  String? get iconHash => _iconHash;
  int? get createAt => _createAt;
  String? get defaultConversationId => _defaultConversationId;
  String? get organizationId => _organizationId;
  String? get timelineConversationId => _timelineConversationId;
  bool? get isInvitation => _isInvitation;
  // My_membership? get myMembership => _myMembership;
  // Worker_node? get workerNode => _workerNode;

  WorkspaceDto({
      String? id,
      String? name,
      String? displayName,
      String? description,
      String? iconHash,
      int? createAt,
      String? defaultConversationId,
      String? organizationId,
      String? timelineConversationId,
      bool? isInvitation,
      My_membership? myMembership,
      Worker_node? workerNode}){
    _id = id;
    _name = name;
    _displayName = displayName;
    _description = description;
    _iconHash = iconHash;
    _createAt = createAt;
    _defaultConversationId = defaultConversationId;
    _organizationId = organizationId;
    _timelineConversationId = timelineConversationId;
    _isInvitation = isInvitation;
    // _myMembership = myMembership;
    // _workerNode = workerNode;
}

  WorkspaceDto.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _displayName = json['display_name'];
    _description = json['description'];
    _iconHash = json['icon_hash'];
    _createAt = json['create_at'];
    _defaultConversationId = json['default_conversation_id'];
    _organizationId = json['organization_id'];
    _timelineConversationId = json['timeline_conversation_id'];
    _isInvitation = json['is_invitation'];
    // _myMembership = json['my_membership'] != null ? My_membership.fromJson(json['myMembership']) : null;
    // _workerNode = json['worker_node'] != null ? Worker_node.fromJson(json['workerNode']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['display_name'] = _displayName;
    map['description'] = _description;
    map['icon_hash'] = _iconHash;
    map['create_at'] = _createAt;
    map['default_conversation_id'] = _defaultConversationId;
    map['organization_id'] = _organizationId;
    map['timeline_conversation_id'] = _timelineConversationId;
    map['is_invitation'] = _isInvitation;
    // if (_myMembership != null) {
    //   map['my_membership'] = _myMembership?.toJson();
    // }
    // if (_workerNode != null) {
    //   map['worker_node'] = _workerNode?.toJson();
    // }
    return map;
  }

}


class Worker_node {
  String? _apiUrl;
  String? _websocketUrl;
  String? _fileUrl;

  String? get apiUrl => _apiUrl;
  String? get websocketUrl => _websocketUrl;
  String? get fileUrl => _fileUrl;

  Worker_node({
      String? apiUrl,
      String? websocketUrl,
      String? fileUrl}){
    _apiUrl = apiUrl;
    _websocketUrl = websocketUrl;
    _fileUrl = fileUrl;
}

  Worker_node.fromJson(dynamic json) {
    _apiUrl = json['api_url'];
    _websocketUrl = json['websocket_url'];
    _fileUrl = json['file_url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['api_url'] = _apiUrl;
    map['websocket_url'] = _websocketUrl;
    map['file_url'] = _fileUrl;
    return map;
  }

}

class My_membership {
  List<String>? _roles;
  String? _workspaceId;
  String? _userId;
  String? _phoneNumber;
  int? _deleteAt;
  int? _lastActivityDate;
  String? _availability;

  List<String>? get roles => _roles;
  String? get workspaceId => _workspaceId;
  String? get userId => _userId;
  String? get phoneNumber => _phoneNumber;
  int? get deleteAt => _deleteAt;
  int? get lastActivityDate => _lastActivityDate;
  String? get availability => _availability;

  My_membership({
      List<String>? roles,
      String? workspaceId,
      String? userId,
      String? phoneNumber,
      int? deleteAt,
      int? lastActivityDate,
      String? availability}){
    _roles = roles;
    _workspaceId = workspaceId;
    _userId = userId;
    _phoneNumber = phoneNumber;
    _deleteAt = deleteAt;
    _lastActivityDate = lastActivityDate;
    _availability = availability;
}

  My_membership.fromJson(dynamic json) {
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _workspaceId = json['workspace_id'];
    _userId = json['user_id'];
    _phoneNumber = json['phone_number'];
    _deleteAt = json['delete_at'];
    _lastActivityDate = json['last_activity_date'];
    _availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['roles'] = _roles;
    map['workspace_id'] = _workspaceId;
    map['user_id'] = _userId;
    map['phone_number'] = _phoneNumber;
    map['delete_at'] = _deleteAt;
    map['last_activity_date'] = _lastActivityDate;
    map['availability'] = _availability;
    return map;
  }

}