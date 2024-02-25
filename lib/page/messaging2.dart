import 'package:flutter/material.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final List<Map<String, dynamic>> dummyPosts = [
    {
      'user': 'Pankaja', 
      'title': 'Overcoming Challenges', 
      'content': 'Hello everyone! I wanted to share my journey of overcoming challenges as a survivor. It\'s been a tough road, but with the support of this community, I\'ve found strength. Let\'s inspire each other to keep moving forward!',
      'image': 'https://th.bing.com/th/id/OIP.mlK74o9ZAmQ8Lhh3fccx2gHaE_?rs=1&pid=ImgDetMain',
    },
     {
      'user': 'Rakesh', 
      'title': 'Resource Recommendation', 
      'content': 'I came across an excellent resource for survivors - a local support group that offers counseling and workshops. Check it out: [Support Group Link]. Remember, you are not alone, and help is available!',
      'image': 'https://e3az4yc7762.exactdn.com/wp-content/uploads/2022/08/PCI-India_Umang-session-1-768x512.jpg?strip=all&lossy=1&ssl=1',
    },
    // Add more dummy posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messaging Arena'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          return ForumPostCard(post: dummyPosts[index]);
        },
      ),
    );
  }
}

class ForumPostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  const ForumPostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title: ${post['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('User: ${post['user']}'),
                SizedBox(height: 8),
                Text('Content: ${post['content']}'),
              ],
            ),
          ),
          Image.network(
            '${post['image']}', // Replace with your image URL
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          CommentSection(),
        ],
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  List<Map<String, String>> comments = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comments:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          for (var comment in comments) CommentTile(username: comment['username']!, comment: comment['comment']!),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(labelText: 'Add a comment'),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (_commentController.text.isNotEmpty) {
                    setState(() {
                      comments.add({'username': 'Current User', 'comment': _commentController.text});
                      _commentController.clear();
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final String username;
  final String comment;

  const CommentTile({Key? key, required this.username, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$username: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(comment),
        ],
      ),
    );
  }
}
