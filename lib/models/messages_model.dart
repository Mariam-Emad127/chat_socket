class MessagesModel {
final String type;
final String msg;
final String sender;

  MessagesModel( {required this.type, required this.msg,required this.sender,});

    // Factory method لتحويل الـ Map إلى كائن MessagesModel
  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(
      type: json["type"] ?? "",
      msg: json["msg"] ?? "",
      sender: json["sender"] ?? "",
    //  reciver: json["reciver"] ?? "",
    );
  }

 // static final List<dynamic> messages = [];

 // static updateMessages(dynamic message) async {
   // messages.add(message);
  //}
}