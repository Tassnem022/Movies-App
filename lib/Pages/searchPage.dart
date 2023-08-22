import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Models/movieModel.dart';
import 'package:provider/provider.dart';

import '../Providers/moviesProvider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<MoviesProvider>(context,listen: true);
    MovieModel? res ;
    TextEditingController controller =TextEditingController();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);}),
          actions: [
            Form(
              child:
              Row(
                children: [
                  Container(
                    width: 290,
                    child: TextFormField(
                      controller: controller,
                      enabled: true,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 20,color: Colors.white),
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          hintText: '  what you want to Search!',
                          hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      res = _provider.search(controller.text.toString());
                    });

                  }, icon: Icon(Icons.search)),
                ],
              ),
            )
          ],
        ),

        body: res==null?Center(child: Text('No Result',style: TextStyle(color: Colors.white,fontSize: 30),)): Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Container(
                    height: 220,
                    child: Image.network(res?.image[0])),
              ],
            ),
            Column(
              children: [
                Text(res!.title!,style: GoogleFonts.alice(color: Colors.white,fontSize: 18),),
                SizedBox(height: 20,),
                Text('${res?.released!}',style: GoogleFonts.alice(color: Colors.white,fontSize: 18)),
                SizedBox(height: 20,),
                Text('⭐ Average Rating-${res?.rating}',style: TextStyle(color: Colors.white),),
              ],
            )

          ],
        ),
      ),
    );
  }
}
