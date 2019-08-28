class User {
  String session;
  String name;
  String firstLastName;
  String secondLastName;
  String email;
  String mobile;
  String picture;

  User({ this.session, this.name, this.firstLastName, this.secondLastName, this.email,this.mobile, this.picture });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    session: json["session"],
    name: json["name"],
    firstLastName: json["firstLastName"],
    secondLastName: json["secondLastName"],
    email: json["email"],
    mobile: json["mobile"],
    picture: json["picture"],    
  );

  Map<String, dynamic> toJson() => {
    "session": session,
    "name": name,
    "firstLastName": firstLastName,
    "secondLastName": secondLastName,
    "email": email,
    "mobile": mobile,
    "picture": picture
  };  
}