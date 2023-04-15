import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_builder/Class/dataModel.dart';
import 'package:printing/printing.dart';
import 'package:resume_builder/utiles/pdfMaker.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    DataModel d1=ModalRoute.of(context)!.settings.arguments as DataModel;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text(
          "PDF Maker"
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(onTap: () async {
              await Printing.layoutPdf(onLayout: (format) => pdfMaker(d1),);
            },child: Icon(Icons.download)),
          )
        ],
      ),
    body: SingleChildScrollView(
      child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 60),
                    Container(
                      height: 150,width: double.infinity,
                      decoration: BoxDecoration(color: Colors.red.shade200),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${d1.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 1),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      height: 785,width: 150,
                      decoration: BoxDecoration(color: Colors.blueGrey.shade200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 75),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(File("${d1.photoPath}")),
                            ),
                          ),
                          SizedBox(height: 60),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("PROFILE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 1)),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Business Administration studunt.\n"
                                "I consider my self a responsible and orderly person.\n"
                                "I am looking forword for my frist work experience.",
                                style: TextStyle(color: Colors.white,fontSize: 13,letterSpacing: 1)),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("CONTACT ME",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 1)),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Icon(Icons.call,color: Colors.white,),
                                SizedBox(width: 5),
                                Text("${d1.contect}",
                                    style: TextStyle(color: Colors.white,fontSize: 13,letterSpacing: 1)),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Icon(Icons.mail_outline,color: Colors.white,),
                                SizedBox(width: 5),
                                Container(height: 50,width:90,child: Text("${d1.email}",style: TextStyle(color: Colors.white,fontSize: 13,letterSpacing: 1))),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Icon(Icons.location_on,color: Colors.white,),
                                SizedBox(width: 5),
                                Text("${d1.add}",style: TextStyle(color: Colors.white,fontSize: 13,letterSpacing: 1)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 210,left: 187),
                      child: Container(
                        height: 580,width: 210,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.send,color: Colors.grey,),
                                  SizedBox(width: 10),
                                  Text("EDUCATION",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 17,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Text("${d1.edu}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 15),)
                                ),
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.send,color: Colors.grey,),
                                  SizedBox(width: 10),
                                  Text("LANGUAGE",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 17,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text("${d1.language}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 15),)
                              ),
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.send,color: Colors.grey,),
                                  SizedBox(width: 10),
                                  Text("WORK\nEXPERIENCE",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 17,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text("${d1.ex}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 15),)
                              ),
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.send,color: Colors.grey,),
                                  SizedBox(width: 10),
                                  Text("EXPECTED\nSALARY",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 17,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text("${d1.rangeValues?.start.toInt()} - ${d1.rangeValues?.end.toInt()}",
                                    style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 15),)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    ),
    ));
  }
}
