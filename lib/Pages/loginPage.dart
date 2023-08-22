import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Models/userModel.dart';
import 'package:project/Pages/registerPage.dart';

import 'MoviesPage.dart';

class LoginPage extends StatefulWidget {
   LoginPage(this.user,{Key? key}) : super(key: key);
  late UserModel user ;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:MyLoginPage(widget.user));
  }
}


class MyLoginPage extends StatefulWidget {
    MyLoginPage(this.user,{super.key});
    late UserModel user ;
    @override
  MyLoginPageState createState() => MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();

    TextEditingController controller1 =TextEditingController();

     TextEditingController controller2 =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black,Colors.black87,Colors.redAccent.shade700],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60, // Image radius
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3024/3024605.png'),
                ),
                SizedBox(height: 30,),
                Text ('Login',style: GoogleFonts.alice(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 50)) ,
                SizedBox(height: 30,),
                Container(
                  margin: const EdgeInsets.fromLTRB(30,20,30,20),
                  child: TextFormField(
                    style: TextStyle(fontSize: 25,color: Colors.white),
                    controller: controller1,
                    validator: (String? value){
                      if(value!.isEmpty){return 'Please Enter User Name';}
                    },
                    cursorColor: Colors.white,
                    decoration:  InputDecoration(
                      errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: Colors.white,width: 2)),
                      fillColor: Colors.grey.shade200.withOpacity(0.2) ,
                      filled: true,
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: Colors.white,width: 2)),
                      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2,color: Colors.white),borderRadius: BorderRadius.circular(20)),
                      label: Container(
                        padding: EdgeInsets.all(10),
                        width: 150,
                        child: const Row(
                          children: [
                            Icon(Icons.person,color: Colors.white,),
                            SizedBox(width: 15,),
                            Text('User Name',style: TextStyle(color: Colors.white,fontSize: 15),)
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30,20,30,20),
                  child: TextFormField(
                    style: TextStyle(fontSize: 25,color: Colors.white),
                    controller: controller2,
                    validator: (String? value){
                      if(value!.isEmpty){return 'Please Enter Password';}
                    },
                    cursorColor: Colors.white,
                    decoration:  InputDecoration(
                      errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: Colors.white,width: 2)),
                      fillColor: Colors.grey.shade200.withOpacity(0.2) ,
                      filled: true,
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: Colors.white,width: 2)),
                      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2,color: Colors.white),borderRadius: BorderRadius.circular(20)),
                      label: Container(
                        padding: EdgeInsets.all(10),
                        width: 150,
                        child: const Row(
                          children: [
                            Icon(Icons.lock,color: Colors.white,),
                            SizedBox(width: 15,),
                            Text('Password',style: TextStyle(color: Colors.white,fontSize: 15),)
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      fixedSize: MaterialStatePropertyAll(Size(150,40)),backgroundColor:MaterialStatePropertyAll(Colors.white) ),
                    onPressed: (){
                    if(_formKey.currentState!.validate()){
                      if(controller1.text.contains(widget.user.userName)&&controller2.text.contains(widget.user.password)){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>  MoviesPage(widget.user))) ;
                      }
                      else{
                        const snackBar = SnackBar(
                          content: Text('UserName or Password is not correct'),);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    },
                    child: Text('Sign In',style: TextStyle(color: Colors.black,fontSize: 20)),

                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                }, child: Text("New User? Create Account",style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ),
      );
  }
}



