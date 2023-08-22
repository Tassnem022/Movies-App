import 'package:project/Models/movieModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;
import 'package:flutter/material.dart';

class MoviesProvider  extends ChangeNotifier {
  List<MovieModel>  favourite =[];
  List <MovieModel> movies    =[];
  List <MovieModel> movies2   =[];

void getMovies()async{
  int counter=0 ;
  var uri = Uri.https('ott-details.p.rapidapi.com', '/advancedsearch',{
    'start_year': '1970',
    'end_year': '2020',
    'min_imdb': '6',
    'max_imdb': '7.8',
    'genre': 'action',
    'language': 'english',
    'type': 'movie',
    'sort': 'latest',
    'page': '1'});

  http.Response response =await http.get(uri,headers: {'X-RapidAPI-Key': 'e17197d420mshdec4bb351baebf2p1a6c54jsn44cab5d83fbe',
    'X-RapidAPI-Host': 'ott-details.p.rapidapi.com'});

  if(response.statusCode==200){
    Map<String, dynamic> body =converter.jsonDecode(response.body) ;
    List<dynamic> list = body['results'] ;
    for(var i in list ){
      counter++;
      if(counter<=13){
      movies.add(MovieModel.fromjason(i));}
      else{movies2.add(MovieModel.fromjason(i));}
      notifyListeners();
       }

  }
}

addToFavourite(int index,bool page){
  if(page) { favourite.add(movies[index]);}
  else{favourite.add(movies2[index]);}
  notifyListeners();
}

removeFromFavourite(int index,bool page){
  if(page){favourite.remove(movies[index]);}
  else{favourite.remove(movies2[index]);}
  notifyListeners();
}
MovieModel? search (String searchedTitle){
  for(int i =0 ; i<movies.length;i++){
    if(movies[i].title!.contains(searchedTitle)){
      return movies[i];
    }

    }
  for(int i =0 ; i<movies2.length;i++){
    if(movies2[i].title!.contains(searchedTitle)){
      return movies2[i];
    }

    }
  notifyListeners();
  }
}