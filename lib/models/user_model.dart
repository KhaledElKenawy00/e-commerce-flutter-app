

class UserModel {
 String ?name;
  String ?email;
  String ?userid;
 String ?picure;
  UserModel({
     this.name,
     this.email,
     this.userid,
     this.picure,
    
  });
 
 UserModel.fromJson(Map<dynamic,dynamic>map)
 {
  if (map==null)
  {
    return;
  }
  name=map['name'];
  email=map['email'];
  userid=map['userid'];
  picure=map['picure'];

 }

 toJson()
 {
 return{
  'name':name,
  'email':email,
  'userid':userid,
  'picure':picure

 };

 }

 
   





  
}
