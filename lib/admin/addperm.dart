import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maidsmatch_maids/comp/custom_button.dart';

import '../utils/app_styles.dart';

class addPermFrom extends StatefulWidget {
  const addPermFrom({super.key});

  @override
  State<addPermFrom> createState() => _addPermFromState();
}

class _addPermFromState extends State<addPermFrom> {
  DateTime? selecteddate;
  final nameController = TextEditingController();

    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "MAID MATCH",
          style: Styles.headlineStyle,
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orangeAccent.shade100,
        child: Column(
          children: const [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('M E S S A G E'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('S E T T I N G S'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('L O G O U T'),
            ),
          ],
        ),
      ),
      backgroundColor: Styles.backgColor,
      body:SafeArea(
        child: ListView(
          children: [
            Padding(padding: const EdgeInsets.all(40)),
            
            Column(
          
          children: [
            
            textField(
              hintText: "Name of worker", 
              inputType: TextInputType.name, 
              maxLines: 1, 
              controller: nameController),
              Gap(10),
            textField(
              hintText: "Area Residence", 
              inputType: TextInputType.streetAddress, 
              maxLines: 1, 
              controller: nameController),
              Gap(10),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DateTimeFormField(
                    
                  decoration: const InputDecoration(
                    
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date of birth',
                  ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      selecteddate = value;
                  },
                              ),
                ),
              Gap(10),
            
            textField(
              hintText: "Level of Education", 
              inputType: TextInputType.name, 
              maxLines: 1, 
              controller: nameController),
              Gap(10),
            textField(
              hintText: "Brief background", 
              inputType: TextInputType.name, 
              maxLines: 3, 
              controller: nameController),
              Gap(20),

              customButton(
                text: "Recruit Permanent Maid", 
                onPressed: (){

              })
      
            
          ],
        ) ,
          ],
        ),
      )

    );
  }

    Widget textField({
    required String hintText,  
    required TextInputType inputType, 
    required int maxLines, 
    required TextEditingController controller
    }){
    return Padding(padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5,),
    child: TextFormField(
      cursorColor: Colors.blueAccent,
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide( color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide( color: Colors.blueAccent),
        ),
        hintText: hintText,
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Styles.backgColor,
        filled: true,

      ),
    ),
    );
  }
}