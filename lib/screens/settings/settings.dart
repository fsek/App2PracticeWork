import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState(); 
}

class _SettingsPageState extends State<SettingsPage>{

  User? user; 
  static const programs = ["Teknisk Fysik", "Teknisk Matematik", "Teknisk Nanovetenska", "Oklart"];
  static const foodPrefs = ["vegetarian", "vegan", "pescetarian", "milk", "gluten"];
  static const foodPrefsDisplay = {"vegetarian": "Vegetarian", "vegan": "Vegan", 
    "pescetarian": "Pescetarian", "milk": "Mjölkallergi", "gluten": "Gluten"}; 
  static List<int> years = List.generate(DateTime.now().year-1960, (i) => DateTime.now().year-i); 
  bool extraPref = false; 

  void initState(){
    locator<UserService>().getUser().then((value) {
      setState((){
        user = value;
        extraPref = user!.food_custom != ""; 
        print(user!.food_custom);
      }); 
    }); 
    super.initState();
  }

  Widget build(BuildContext context){
    if(user == null){
      return Scaffold(
        appBar: AppBar(title: Text("Inställningar")),
        body: Center(
          child: CircularProgressIndicator(color: Colors.orange[600])
        )
      ); 
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Inställningar"),
        actions: [
          Padding(
            padding: 
              EdgeInsets.only(right: 16),
              child: 
                GestureDetector(
                  onTap: () {
                    showDialog(context: context,
                    builder: savingPopup()); 
                    locator<UserService>().updateUser(user!).then((value) { 
                      setState(() {
                        extraPref = user!.food_custom != "";  
                      });
                      Navigator.pop(context);
                    });

                  },
                  child: Text("Spara"),
                ),
            ),
          ],
        ), //Alot of the code here is duplicate. could be made much more compact
      body:SingleChildScrollView(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Förnamn*"),
            TextField(
              controller: TextEditingController(text: user!.firstname),
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              onChanged: (input) {
                  user!.firstname = input;
                  print(user!.food_custom);
              },
            ),
            Text("Efternamn*"),
            TextField(
              controller: TextEditingController(text: user!.lastname),
              decoration: InputDecoration(
                border: OutlineInputBorder(),     
              ),
              onChanged: (input) {
                  user!.lastname = input;
              },
            ),
            Text("Program"),
            DropdownButton(
              isExpanded: true,
              value: user!.program,  
              items: programs.map((program) => 
                DropdownMenuItem(
                  child: Text(program),
                  value: program)
                ).toList(),
              onChanged: (String? program){
                setState((){
                  if(program != user!.program){
                    user!.program = program; 
                  }
                }); 
              },
            ),
            Text("Startår"),
            DropdownButton(
              isExpanded: true,
              value:user!.start_year,
              items: years.map((year) => 
                DropdownMenuItem(
                  child: Text(year.toString()),
                  value: year)).toList(),
              onChanged: (int? year){
                setState((){
                  if(year != user!.start_year){
                    user!.start_year = year; 
                  }
                });
              }
            ), 
            Text("Nedstående fält används endast för sektionsval, bilbokning samt arbete i Hilbert Café. Kan ses av styrelsen, administratörer samt ansvariga för val, bokning eller caféet"),
            Text("LUCAT-id"), 
            TextField(
              controller: TextEditingController(text: user!.student_id != null ? user!.student_id : ""),
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              onChanged: (input) {
                user!.student_id = input;
              },
            ),
            Text("Telefon"), 
            TextField(
              controller: TextEditingController(text: user!.phone != null ? user!.phone : ""),
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                user!.phone = input; 
             }, 
            ),
            Row(
              children: [
                Text("Visa tel. för gruppmedlemmar"),
                Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                value: user!.display_phone, 
                onChanged: (bool? value){
                  setState(() {
                      user!.display_phone = value; 
                  });
                },)
              ]
            ),
            DropdownButton(
              isExpanded: true,
              hint: Text("Matpreferenser"),
              items: foodPrefs.map((foodPref) => 
                DropdownMenuItem(
                  child: Row(
                    children: [ 
                      Text(foodPrefsDisplay[foodPref]!),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setChildState){ 
                          return Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                            value: user!.food_preferences!.contains(foodPref), 
                            onChanged: (bool? add){
                              setChildState(() {
                                if(add!)
                                  user!.food_preferences!.add(foodPref);
                                else 
                                  user!.food_preferences!.remove(foodPref);
                              });
                            },
                          );
                        } 
                      )
                    ]
                  ),
                  value: foodPref)
                ).toList()
                ..add(
                  DropdownMenuItem(
                    child: Row(children: [Text("Annat"),
                        StatefulBuilder(
                          builder: (BuildContext context, StateSetter setChildState){
                            return Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                              value: extraPref,
                              onChanged: (bool? add){
                                setChildState(() => extraPref = add!);
                                setState(() {});
                              }
                            );
                          }
                        )
                      ]
                    ),
                    value: "Annat",
                  )
                ),
                onChanged: (_) {setState(() {
                  
                });},
            ),
            extraPrefTextField(), 
            Text("Matprefersener kan endast ses av de som arrangerar evenmang som du anmält dig till."),
            Text("Följande fält avgör vilka push-notisersom skickas till dina mobila enheter. Notificationer går alltid att se på webbsidan och i appen."),
            Row(
              children: [
                Text("Notiser för eventanmälan"),
                Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                value: user!.notify_event_users, 
                onChanged: (bool? value){
                  setState(() {
                    if(value != user!.notify_event_users){
                      user!.notify_event_users = value; 
                    }
                  });
                },)
              ]
            ),
            Row(
              children: [
                Text("Notiser för meddelande"),
                Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                value: user!.notify_messages, 
                onChanged: (bool? value){
                  setState(() {
                    if(value != user!.notify_messages){
                      user!.notify_messages = value; 
                    }
                  });
                },)
              ]
            ),
            Row(
              children: [
                Text("Visa tel. för gruppmedlemmar"),
                Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                value: user!.notify_event_closing, 
                onChanged: (bool? value){
                  setState(() {
                    if(value != user!.notify_event_closing){
                      user!.notify_event_closing = value; 
                    }
                  });
                },)
              ]
            ),
            Row(
              children: [
                Text("Visa tel. för gruppmedlemmar"),
                Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange[600]),
                value: user!.notify_event_open, 
                onChanged: (bool? value){
                  setState(() {
                    if(value != user!.notify_event_open){
                      user!.notify_event_open = value; 
                    }
                  });
                },)
              ]
            ),
            Text("Medlemskap sedan ${user!.member_at}")
          ]
        ), 
      )
    ); 
  }

  Widget extraPrefTextField(){
    if(extraPref){
      return TextField(   
        controller: TextEditingController(text: user!.food_custom),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Andra matpreferenser/allergier'
        ),
        onChanged: (input) {
          user!.food_custom = input; 
        },
      );
    }
    return Container(); 
  }

  Widget Function(BuildContext) savingPopup(){
    return (BuildContext context) => AlertDialog(
      title: Text("Sparar"),
      content: 
        CircularProgressIndicator(
          color: Colors.orange[600]),
     );
  }

}