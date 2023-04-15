import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/Class/dataModel.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtContect = TextEditingController();
  bool isPerson = false;
  String? selectEdu;
  String? selectExp;
  List check = [false, false, false, false];
  List expList = ["0-1 Year", "2-3 Year", "3-4 Year", "4-5 Year", "5> Year"];
  List eduList = ["B.com", "B.B.A", "B.C.A", "M.C.A", "M.Com", "M.B.A"];
  List lanList = ["Gujrati", "English", "Hindi", "Other"];
  List popList = ["Setting", "Help", "Search"];
  bool loop = false;
  String? gender;
  RangeValues rangeValues = RangeValues(15000, 30000);
  var txtkey = GlobalKey<FormState>();
  String? path;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: WillPopScope(
        onWillPop: back,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            centerTitle: true,
            title: Text(
              "Resume",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Setting",
                              style: TextStyle(color: Colors.black)),
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text("Help",
                              style: TextStyle(color: Colors.black)),
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text("About",
                              style: TextStyle(color: Colors.black)),
                          onTap: () {},
                        ),
                      ])
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                path == null
                    ? Image.asset("assets/images/user.png",
                        height: 150, width: 150)
                    : CircleAvatar(
                        radius: 90,
                        backgroundImage: FileImage(File("$path")),
                      ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? xfile = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            path = xfile!.path;
                          });
                        },
                        child: Text("Gallery",style: TextStyle(letterSpacing:1)),style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),),
                    ElevatedButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? xfile = await imagePicker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            path = xfile!.path;
                          });
                        },
                        child: Text("Camera",style: TextStyle(letterSpacing:1),),style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent))
                  ],
                ),
                SizedBox(height: 10),
                ExpansionTile(
                  collapsedIconColor: Colors.purpleAccent,
                  iconColor: Colors.purpleAccent,
                  title: Text(
                    "Personal Section",
                    style: TextStyle(
                        color: Colors.black, fontSize: 17, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.person, color: Colors.purpleAccent),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: txtName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Value";
                              }
                              return null;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1)),
                                label: Text(
                                  "Full Name",
                                  style: TextStyle(color: Colors.black),
                                ),
                                fillColor: Colors.purpleAccent,
                                focusColor: Colors.purpleAccent,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: txtAdd,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Value";
                              }
                              return null;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1)),
                                label: Text(
                                  "Address",
                                  style: TextStyle(color: Colors.black),
                                ),
                                fillColor: Colors.purpleAccent,
                                focusColor: Colors.purpleAccent,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: txtEmail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Value";
                              }
                              return null;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1)),
                                label: Text(
                                  "E-Mail",
                                  style: TextStyle(color: Colors.black),
                                ),
                                fillColor: Colors.purpleAccent,
                                focusColor: Colors.purpleAccent,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            controller: txtContect,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Value";
                              } else if (value.length != 10) {
                                return "Please Enter 10 Digit";
                              }
                              return null;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1)),
                                label: Text(
                                  "Contact",
                                  style: TextStyle(color: Colors.black),
                                ),
                                fillColor: Colors.purpleAccent,
                                focusColor: Colors.purpleAccent,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1))),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (txtkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Name : ${txtName.text}\nAddress : ${txtAdd.text}\nE-Mail : ${txtEmail.text}\nContact : ${txtContect.text}"),
                                  backgroundColor: Colors.purpleAccent,
                                  behavior: SnackBarBehavior.floating,
                                ));
                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 1),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Gender",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    color: Colors.purpleAccent),
                              ),
                              RadioListTile(
                                  value: "Male",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  },
                                  title: Text("Male"),
                                  activeColor: Colors.purpleAccent),
                              RadioListTile(
                                  value: "FeMale",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  },
                                  title: Text("Female"),
                                  activeColor: Colors.purpleAccent),
                              RadioListTile(
                                  value: "Transgender",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  },
                                  title: Text("Transgender"),
                                  activeColor: Colors.purpleAccent),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ExpansionTile(
                  collapsedIconColor: Colors.purpleAccent,
                  iconColor: Colors.purpleAccent,
                  title: Text(
                    "Education Section",
                    style: TextStyle(
                        color: Colors.black, fontSize: 17, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.book, color: Colors.purpleAccent),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                          alignment: Alignment.center,
                          isExpanded: true,
                          items: eduList
                              .map((e) => DropdownMenuItem(
                                    child: Center(child: Text("$e")),
                                    value: e,
                                  ))
                              .toList(),
                          focusColor: Colors.purpleAccent.shade100,
                          hint: Text(
                            "Selecte Education",
                            style: TextStyle(color: Colors.black),
                          ),
                          value: selectEdu,
                          onChanged: (value) {
                            setState(() {
                              selectEdu = value as String;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListTile(
                    title: Text(
                      "Language Section",
                      style: TextStyle(
                          color: Colors.black, fontSize: 17, letterSpacing: 1),
                    ),
                    leading: Icon(Icons.language, color: Colors.purpleAccent),
                    trailing: Switch(
                      value: loop,
                      onChanged: (value) {
                        setState(() {
                          loop = value;
                        });
                      },
                      activeColor: Colors.purpleAccent,
                    )),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Visibility(
                    visible: loop,
                    child: Column(
                      children: [
                        CheckboxListTile(
                          value: check[0],
                          activeColor: Colors.purpleAccent,
                          onChanged: (value) {
                            setState(() {
                              check[0] = value!;
                            });
                          },
                          title: Text(
                            "${lanList[0]}",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        ),
                        CheckboxListTile(
                          value: check[1],
                          activeColor: Colors.purpleAccent,
                          onChanged: (value) {
                            setState(() {
                              check[1] = value!;
                            });
                          },
                          title: Text(
                            "${lanList[1]}",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        ),
                        CheckboxListTile(
                          value: check[2],
                          activeColor: Colors.purpleAccent,
                          onChanged: (value) {
                            setState(() {
                              check[2] = value!;
                            });
                          },
                          title: Text(
                            "${lanList[2]}",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        ),
                        CheckboxListTile(
                          value: check[3],
                          activeColor: Colors.purpleAccent,
                          onChanged: (value) {
                            setState(() {
                              check[3] = value!;
                            });
                          },
                          title: Text(
                            "${lanList[3]}",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.purpleAccent,
                  iconColor: Colors.purpleAccent,
                  title: Text(
                    "Work Experiance Section",
                    style: TextStyle(
                        color: Colors.black, fontSize: 17, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.work, color: Colors.purpleAccent),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                          alignment: Alignment.center,
                          isExpanded: true,
                          items: expList
                              .map((e) => DropdownMenuItem(
                                    child: Center(child: Text("$e")),
                                    value: e,
                                  ))
                              .toList(),
                          focusColor: Colors.purpleAccent.shade100,
                          hint: Text(
                            "Selecte Experiance",
                            style: TextStyle(color: Colors.black),
                          ),
                          value: selectExp,
                          onChanged: (value) {
                            setState(() {
                              selectExp = value as String;
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(height: 10),
                ExpansionTile(
                  collapsedIconColor: Colors.purpleAccent,
                  iconColor: Colors.purpleAccent,
                  title: Text(
                    "Salary Section",
                    style: TextStyle(
                        color: Colors.black, fontSize: 17, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.currency_rupee_outlined,
                      color: Colors.purpleAccent),
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RangeSlider(
                          max: 100000,
                          divisions: 20,
                          values: rangeValues,
                          labels: RangeLabels(
                              "${rangeValues.start}", "${rangeValues.end}"),
                          onChanged: (value) {
                            setState(() {
                              rangeValues = value;
                            });
                          },
                          activeColor: Colors.purpleAccent,
                        ))
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    var language = "";
                    if (check[0] == true) {
                      language = "$language Gujarati";
                    }
                    if (check[1] == true) {
                      language = "$language English";
                    }
                    if (check[2] == true) {
                      language = "$language Hindi";
                    }
                    if (check[3] == true) {
                      language = "$language Other";
                    }
                    var name = txtName.text;
                    var add = txtAdd.text;
                    var eMail = txtEmail.text;
                    var contect = txtContect.text;

                    DataModel d1 = DataModel(name, add, eMail, contect, gender, language, selectEdu, selectExp, rangeValues, path);
                    Navigator.pushNamed(context, 'Save',arguments: d1);
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void exit1() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Are you sure to Exit")),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text("Yes"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("No"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                )
              ],
            )
          ],
        );
      },
    );
  }

  Future<bool> back() async {
    exit1();
    return await false;
  }
}
