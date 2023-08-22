import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Pages/searchPage.dart';
import 'package:project/Pages/seeMorePage.dart';
import 'package:project/Pages/userInfo.dart';
import 'package:project/Providers/moviesProvider.dart';
import 'package:provider/provider.dart';

import '../Models/userModel.dart';
import 'FavouriteMovies.dart';

class MoviesPage extends StatefulWidget {
   MoviesPage(this.user,{Key? key}) : super(key: key);
  UserModel user ;
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyMoviesPage(widget.user),);
  }
}

class MyMoviesPage extends StatefulWidget {
   MyMoviesPage(this.user,{Key? key}) : super(key: key);
  UserModel user ;
  @override
  State<MyMoviesPage> createState() => _MyMoviesPageState();
}


class _MyMoviesPageState extends State<MyMoviesPage> {


  @override
  void initState() {
    final _provider = Provider.of<MoviesProvider>(context,listen: false);
    _provider.getMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final _provider = Provider.of<MoviesProvider>(context,listen: true);


    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('Movies',style: TextStyle(fontSize: 22,color: Colors.redAccent.shade400)),
        leading: Icon(Icons.movie_creation_outlined),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>UserInfo(widget.user) ,));
          },  icon: Icon(Icons.person))],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.white
          ),
        ],
        onTap: (int i){
          if(i==2){Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage() ));}
          if(i==1){Navigator.push(context, MaterialPageRoute(builder: (context)=> Favourite() ));}
        },
        unselectedLabelStyle: TextStyle(color: Colors.white,),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.redAccent.shade700,),

      body:_provider.movies2.isEmpty?Center(child: CircularProgressIndicator(color: Colors.redAccent.shade700),): Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 10,),
            Text(' Trending Movies', style: GoogleFonts.alice(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
            Flexible(
              child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeMore(index,true)) );
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                          height: 220,
                          child: _provider.movies2[index].image.isEmpty?Image.network('https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg'):Image.network(_provider.movies[index].image![0]!,
                            errorBuilder:(context, error, stackTrace) => Image.network('https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg',)
                            ,)),
                      Text(_provider.movies[index].title!.length>17?'The Cloud':_provider.movies[index].title! ,style: GoogleFonts.alice(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 5,); },
              itemCount: _provider.movies.length,
              scrollDirection: Axis.horizontal,
          ),
            ),
            Text('  Top Rated Movies', style: GoogleFonts.alice(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeMore(index,false)) );},
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                            height: 220,
                            child:_provider.movies2[index].image.isEmpty?Image.network('https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg',): Image.network(_provider.movies2[index].image![0]!
                              ,errorBuilder:(context, error, stackTrace) => Image.network('https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg',),)),
                        Text(_provider.movies2[index].title!.length>17?'The Cloud':_provider.movies2[index].title!,style: GoogleFonts.alice(color: Colors.white,fontSize: 18),)
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 5,); },
                itemCount: _provider.movies2.length,
                scrollDirection: Axis.horizontal,
              ),
            ),

          ]  ),
      ) ,
    ) ;
  }

}
