

class ConfigDto {
  dynamic _userConfig;
  dynamic _dynamicConfig;
  late Config _config;

  dynamic get userConfig => _userConfig;
  dynamic get dynamicConfig => _dynamicConfig;
  Config get config => _config;

  ConfigDto({
    dynamic userConfig,
    dynamic dynamicConfig,
    required Config config}){
    _userConfig = userConfig;
    _dynamicConfig = dynamicConfig;
    _config = config;
  }

  ConfigDto.fromJson(dynamic json) {
    _userConfig = json["userConfig"];
    _dynamicConfig = json["dynamicConfig"];
    _config = (json["config"] != null ? Config.fromJson(json["config"]) : null)!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userConfig"] = _userConfig;
    map["dynamicConfig"] = _dynamicConfig;
    if (_config != null) {
      map["config"] = _config.toJson();
    }
    return map;
  }

}

class Config {
  late String _fileServerUrl;
  late String _telegramNotifBotUsername;
  late String _videoCallType;
  late String _deploymnetType;
  late String _showPublicPanelOnInitialLoading;
  late String _minCompatibleVersion;
  late Server _server;

  String get fileServerUrl => _fileServerUrl;
  String get telegramNotifBotUsername => _telegramNotifBotUsername;
  String get videoCallType => _videoCallType;
  String get deploymnetType => _deploymnetType;
  String get showPublicPanelOnInitialLoading => _showPublicPanelOnInitialLoading;
  String get minCompatibleVersion => _minCompatibleVersion;
  Server get server => _server;

  Config({
    required String fileServerUrl,
    required String telegramNotifBotUsername,
    required String videoCallType,
    required String deploymnetType,
    required String showPublicPanelOnInitialLoading,
    required String minCompatibleVersion,
    required Server server}){
    _fileServerUrl = fileServerUrl;
    _telegramNotifBotUsername = telegramNotifBotUsername;
    _videoCallType = videoCallType;
    _deploymnetType = deploymnetType;
    _showPublicPanelOnInitialLoading = showPublicPanelOnInitialLoading;
    _minCompatibleVersion = minCompatibleVersion;
    _server = server;
  }

  Config.fromJson(dynamic json) {
    _fileServerUrl = json["fileServerUrl"];
    _telegramNotifBotUsername = json["telegramNotifBotUsername"];
    _videoCallType = json["videoCallType"];
    _deploymnetType = json["deploymnetType"];
    _showPublicPanelOnInitialLoading = json["showPublicPanelOnInitialLoading"];
    _minCompatibleVersion = json["app.minCompatibleVersion"];
    _server = (json["server"] != null ? Server.fromJson(json["server"]) : null)!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["fileServerUrl"] = _fileServerUrl;
    map["telegramNotifBotUsername"] = _telegramNotifBotUsername;
    map["videoCallType"] = _videoCallType;
    map["deploymnetType"] = _deploymnetType;
    map["showPublicPanelOnInitialLoading"] = _showPublicPanelOnInitialLoading;
    map["app.minCompatibleVersion"] = _minCompatibleVersion;
    map["server"] = _server.toJson();
    return map;
  }

}

class Server {
  late String _protocol;
  late String _port;
  late String _host;
  late String _contextPath;

  String get protocol => _protocol;
  String get port => _port;
  String get host => _host;
  String get contextPath => _contextPath;

  Server({
    required String protocol,
    required String port,
    required String host,
    required String contextPath}){
    _protocol = protocol;
    _port = port;
    _host = host;
    _contextPath = contextPath;
  }

  Server.fromJson(dynamic json) {
    _protocol = json["protocol"];
    _port = json["port"];
    _host = json["host"];
    _contextPath = json["contextPath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["protocol"] = _protocol;
    map["port"] = _port;
    map["host"] = _host;
    map["contextPath"] = _contextPath;
    return map;
  }

}