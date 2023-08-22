import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Providers/moviesProvider.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('Favourite',style: TextStyle(fontSize: 22,color: Colors.redAccent.shade400)),
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded),onPressed: (){Navigator.pop(context);}) ,
        actions: [
          IconButton(onPressed: (){},  icon: Icon(Icons.person)),
        ],

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
        ],
        onTap: (int i){
          if(i==0){
            Navigator.pop(context);
          }
          if(i==1){}
        },
        unselectedLabelStyle: TextStyle(color: Colors.white,),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.redAccent.shade700,),

      body: ListView.separated(
            shrinkWrap: true,
            itemCount: _provider.favourite.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                            height: 220,
                            child: Image.network(_provider.favourite[index].image![0]!,
                                errorBuilder:(context, error, stackTrace) => Container(width: 150,child: Image.network('https://c8.alamy.com/comp/RC04FA/old-fashioned-movie-film-camera-logo-design-template-black-and-white-vector-illustration-RC04FA.jpg',)))),
                      ],
                    ),
                   Column(
                     children: [
                       Text(_provider.favourite[index].title!.length>17?'the Cloud':_provider.favourite[index].title!,style: GoogleFonts.alice(color: Colors.white,fontSize: 18),),
                       SizedBox(height: 20,),
                       Text('${_provider.favourite[index].released!}',style: GoogleFonts.alice(color: Colors.white,fontSize: 18)),
                       SizedBox(height: 20,),
                       Text('⭐ Average Rating-${_provider.favourite[index].rating}',style: TextStyle(color: Colors.white),),
                     ],
                   )

                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5,); },)



    );
  }
}
