import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Models/userModel.dart';

class UserInfo extends StatelessWidget {
   UserInfo(this.user,{Key? key}) : super(key: key);
  UserModel user  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('My Account',style: TextStyle(fontSize: 22,color: Colors.redAccent.shade400)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child: Image.network('https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')),
          SizedBox(height: 30,),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 35) ,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("  UserName :   ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(user.userName,style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  ],),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("  Password :   ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(user.password,style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  ],),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("  Email :  ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(user.email,style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  ],),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("  Phone :   ",style: GoogleFonts.alice(color: Colors.redAccent.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(user.phone,style: GoogleFonts.alice(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  ],),
              ],
            ),
          )
        ],

      ),
    );
  }
}
