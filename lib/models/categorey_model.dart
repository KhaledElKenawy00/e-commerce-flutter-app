class CategoreyModel 
{
 String name;
String image;

  CategoreyModel({ required this.name, required this.image});

  
factory CategoreyModel.fromJson(Map<dynamic,dynamic>map)
{
  return CategoreyModel(name: map['name'], image:map['image']);
}




}