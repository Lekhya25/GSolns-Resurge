import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Messaging Arena'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
      );
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final TextEditingController _controller = TextEditingController();
 late IO.Socket socket;

  

  @override
  void initState() {
    super.initState();
    socket = IO.io('http://localhost:3000');
    socket.on('message', (data) {
      // Handle incoming messages
      print('Incoming message: $data');
    });
    socket.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging Arena'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  // Display messages here
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      socket.emit('message', message);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    socket.disconnect();
    super.dispose();
  }
}
