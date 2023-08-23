class UserModel {
  String name;
  String email;
  String bio;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String role;
  String uid;

  UserModel({
    required this.name, 
    required this.email, 
    required this.bio, 
    required this.profilePic, 
    required this.createdAt,
    required this.phoneNumber,
    required this.role,
    required this.uid});

  //from map
    factory UserModel.fromMap(Map<String, dynamic>map){
      return UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        bio: map['bio'] ?? '',
        uid: map['uid'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '', 
        role: map['role'] ?? '', 
        createdAt: map['createdAt'] ?? '',
        profilePic: map['profilePic'] ?? '',
       
        );
    }

  //to map
  Map<String, dynamic> toMap(){
    return{

        "name":name,
        "email": email,
        "bio": bio,
        "uid": uid,
        "phoneNumber": phoneNumber,
        "role": role,
        "profilePic":profilePic,
        "createdAt" :createdAt,
    };
  }

}