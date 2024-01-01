import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_setting/app_settings.dart';


class HumanBody extends StatefulWidget {
  const HumanBody({Key? key}) : super(key: key);

  @override
  _HumanBodyState createState() => _HumanBodyState();
}

class _HumanBodyState extends State<HumanBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Human Body"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Stack(
        children: <Widget>[
          //background_image
          Image(image: AssetImage(
              ImageLocation.screenIcon + "/human_body.jpg"),height: 800,
            fit: BoxFit.fitHeight,
          ),
          //body
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/create');
                  },
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                        color: Color(0xffe1ceff).withOpacity(.3)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/create');
                  },
                  child: Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                        color: Color(0xffe1ceff).withOpacity(.3)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/create');
                  },
                  child: Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                        color: Color(0xffe1ceff).withOpacity(.3)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/create');
                  },
                  child: Container(
                    height: 90,
                    width: 145,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                        color: Color(0xffe1ceff).withOpacity(.3)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 80,
                        width: 75,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 80,
                        width: 75,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/create');
                      },
                      child: Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                            color: Color(0xffe1ceff).withOpacity(.3)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //left hand
          Positioned(
            top: 180,
            right: 250,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 105,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),
          Positioned(
            top: 285,
            right: 260,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 80,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 270,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 90,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),

          //right hand
          Positioned(
            top: 180,
            left: 250,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 105,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),
          Positioned(
            top: 285,
            left: 260,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 80,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),
          Positioned(
            top: 365,
            left: 270,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 90,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),
          Positioned(
            top: 365,
            left: 270,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/create');
              },
              child: Container(
                height: 90,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                    color: Color(0xffe1ceff).withOpacity(.3)
                ),
              ),
            ),
          ),

    ],
    ),
      ));
  }
}
