import 'package:flutter/material.dart';
import 'package:project/Pages/registerPage.dart';
class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstPage(),);
  }
}


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Stack(
          children: [
            Container(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/back.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),),
            ),
            Positioned(
              left: 70,
                top: 200,
                child: Text('Welcom Back',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold))),
            Positioned(
              top: 350,
                left: 90,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      fixedSize: MaterialStatePropertyAll(Size(200,40)),
                        backgroundColor: MaterialStatePropertyAll(Colors.black)),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    },
                    child: Text("Start")))
          ],
        ),
      );
  }
}
