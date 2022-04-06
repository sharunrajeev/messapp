import 'package:flutter/material.dart';
import 'join_mess.dart';
import 'create_mess.dart';

class MessSelect extends StatelessWidget {
  const MessSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: GestureDetector(
              child: const Image(
              image: AssetImage("assets/img_create-mess.jpg"),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const CreateMess(),
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: GestureDetector(
                child: const Image(
                  image: AssetImage("assets/img_join-mess.jpg"),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const JoinMess(),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

