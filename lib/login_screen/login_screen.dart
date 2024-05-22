import 'package:flutter/material.dart';

class Longin_screen extends StatefulWidget {
  const Longin_screen({super.key});

  @override
  State<Longin_screen> createState() => _Longin_screenState();
}

class _Longin_screenState extends State<Longin_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:BoxDecoration(
              gradient: LinearGradient(colors:[Colors.green,Colors.white,const Color.fromARGB(255, 47, 33, 33)],
              begin: FractionalOffset(0.0, 0.0
              ),
              end:FractionalOffset(1.0,1.0)
              )
            ),
              child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children:[
                    TextSpan(text:"INTRA",
                    style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:60,
                    shadows: [
                      Shadow(offset: Offset(20.0,30.0),
                      blurRadius: 30.0,
                      color: Color.fromARGB(255, 70, 67, 67),
                      ),
                    ]),
                    ),
                  ])),
                  SizedBox(height: 30,),
                  RichText(text: TextSpan(children:[
                        TextSpan(text: "MEDIA",style:TextStyle(fontSize: 60,fontWeight:FontWeight.bold,color: Colors.black,shadows: [
                          Shadow(
                          offset: Offset(20.0, 30.0),
                          blurRadius: 30.0,
                          color: Color.fromARGB(255, 70, 67, 67),
                        ),
                        ]))
                  ])),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 68, 66, 66),
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 68, 66, 66),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText:"Enter Your password (1-8 letters)",
                        prefixIcon: Icon(Icons.lock_open_rounded,color:Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color:const Color.fromARGB(255, 68, 66, 66),
                            width:3,
                          )
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed:(){},
                   child:Container(
                    width: 200,
                    child: Text('Log in',style:TextStyle(fontSize:27,fontWeight:FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,)),
                   style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 43, 43, 43),
                   ),
                   ),
                   SizedBox(height: 5,),
                   Text('Or',style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                   SizedBox(height: 5,),
                   ElevatedButton(onPressed:(){},
                   child:Container(
                    width: 200,
                    child:Text('Sign Up',style: TextStyle(fontSize:27,fontWeight:FontWeight.bold,color:Colors.white),textAlign: TextAlign.center,),),
                   style:ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 43, 43, 43),
                   )
                   )
                          
                ],),
              )
              )),
    );
  }
}