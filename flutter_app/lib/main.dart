import 'package:flutter/material.dart';

void main()=>   runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("Flutter APP"),
    centerTitle: true,
    backgroundColor: Colors.amber[200],
    ),
    body: Container(
      padding: EdgeInsets.fromLTRB(20,20,20,20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://images.pexels.com/photos/2627945/pexels-photo-2627945.jpeg?auto=compress&cs=tinysrgb&w=600',
            width: 200,
            height: 200,
          ),
          Text(
            "Hey Awatef",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[600],
              fontFamily: 'Roboto',
            ),
          ),
          Icon(
            Icons.add_a_photo_rounded,
            color: Colors.cyan,
            size:   30,
          ),
          ElevatedButton(
            onPressed: () { print("you just cliked the button"); }, child: Text(
            "click"
          ),

          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () { },
            child: Text('TextButton'),
          ),
          OutlinedButton.icon(
            onPressed: () {  },
            icon: Icon(
            Icons.access_alarm_outlined,
          ), label: Text( "Awatef"),

          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {  },
child: Text("click"),
backgroundColor: Colors.amber[200],
),
) ;
  }
}
