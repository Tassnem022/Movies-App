import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Providers/moviesProvider.dart';

class SeeMore extends StatefulWidget {
   SeeMore(this.index,this.whichPage, {Key? key}) : super(key: key);
   int index ;
   bool whichPage ;
  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('Movies',style: TextStyle(fontSize: 20,color: Colors.redAccent.shade400)),
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded),onPressed: (){Navigator.pop(context);}) ,

      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        items:  [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon:(widget.whichPage? _provider.movies[widget.index].favourite:_provider.movies2[widget.index].favourite)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined),
              label: 'Favourite',
              backgroundColor: Colors.white
          ),

        ],
        onTap: (int i){
          if(i==0){
            Navigator.pop(context);
          }
          if (i==1){setState(() {
            if(widget.whichPage){
            _provider.movies[widget.index].favourite=!_provider.movies[widget.index].favourite;
            if(_provider.movies[widget.index].favourite){
            _provider.addToFavourite(widget.index,true);}
            else{_provider.removeFromFavourite(widget.index,true);}}
            else{
              _provider.movies2[widget.index].favourite=!_provider.movies2[widget.index].favourite;
              if(_provider.movies2[widget.index].favourite){
                _provider.addToFavourite(widget.index,false);}
              else{_provider.removeFromFavourite(widget.index,false);}
            }

          });}
        },
        unselectedLabelStyle: TextStyle(color: Colors.white,),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.redAccent.shade400,),


      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [Container(
              height: 300,
                child: Image.network(widget.whichPage?_provider.movies[widget.index].image[0]!:_provider.movies2[widget.index].image.isEmpty?'https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg' :_provider.movies2[widget.index].image[0]!,
                    errorBuilder:(context, error, stackTrace) => Image.network('https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg',)),

                alignment: Alignment.center,
                ),
              Positioned(
                 bottom: 20,
                  left: 120,
                  child: Text('⭐ Average Rating-${widget.whichPage?_provider.movies[widget.index].rating:_provider.movies2[widget.index].rating}',style: TextStyle(color: Colors.white),)),
          ]),
          Row(
            children: [
              Text("  Title :   ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(widget.whichPage?_provider.movies[widget.index].title!.length>17?'The Cloud':_provider.movies[widget.index].title!:_provider.movies2[widget.index].title!.length>17?'The Cloud':_provider.movies2[widget.index].title!,style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            ],),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("  Released :   ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(widget.whichPage?'${_provider.movies[widget.index].released}':'${_provider.movies2[widget.index].released}',style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            ],),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("  Genre :    ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(widget.whichPage?'['+_provider.movies[widget.index].genre[0]!+','+_provider.movies[widget.index].genre[1]!+']':'['+_provider.movies2[widget.index].genre[0]!+','+_provider.movies2[widget.index].genre[1]!+']',style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            ],),
          SizedBox(height: 15,),
          Text("  Description :   ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
           margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.whichPage?_provider.movies[widget.index].info!:_provider.movies2[widget.index].info!,style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),))
        ],
      ),

    );
  }
}


