import 'package:flutter/material.dart';

class MultipleInput extends StatefulWidget {
  @override
  _MultipleInputState createState() => _MultipleInputState();
}

class _MultipleInputState extends State<MultipleInput> {
  var dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(3.0)),
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down, size: 22),
        underline: SizedBox(),
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          //Do something with this value
          setState(() {
            dropdownValue = value;
          });
        },
      ),
    );
  }
}
