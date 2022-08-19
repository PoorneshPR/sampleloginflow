import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../common/widgets/commontextformfield.dart';

class ReusableWidgets{
  static Widget reviewLogin(){
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Lets Review",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 25))
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Type Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),


                CommonTextFormField(),
                SizedBox(
                  height: 10,
                ),
                Text("Type Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue){
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return Constants.personsName.where((String select) => select.contains(textEditingValue.text.toLowerCase()) );
                    },
                    onSelected: (String selection) {
                      debugPrint('You just selected $selection');
                    },
                  ),
                ),
                // ElevatedButton(onPressed: (), child: child)
              ],
            ),
          ),
        )
      ],
    );
  }
}