import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String name;

  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text(
          '$name',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(children: [
                Expanded(
                    child: Container(
                  height: 40,
                  // margin:
                  //     EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.emoji_emotions_sharp,
                          color: Colors.yellow,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' Type Something..',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                CircleAvatar(
                  backgroundColor: Colors.teal[900],
                  radius: 20,
                  child: Icon(Icons.mic),
                )
                // TextField(
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: 'Type Something..'),
                // ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
