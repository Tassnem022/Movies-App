
class MovieModel{

 String? title ;
 List<dynamic> image ; //or String?
List<dynamic> genre = [] ;
 var rating ;
 int? released ;
 String? info ;
 bool favourite = false ;

MovieModel({this.title, required this.image, required this.genre, required this.rating, this.released,
      this.info,required this.favourite});

 factory MovieModel.fromjason(Map<String,dynamic>json){
   return MovieModel(
     favourite: false,
     genre:json['genre']??['genre'] ,
     image: json['imageurl'] ?? ['https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg'],
     info: json['synopsis']??'description' ,
     rating:json['imdbrating']??0 ,
     released:json['released']??0 ,
     title: json['title']??'title'
   );
 }
}