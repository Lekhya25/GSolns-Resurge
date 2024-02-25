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
      'content':
          'Hello everyone! I wanted to share my journey of overcoming challenges as a survivor. It\'s been a tough road, but with the support of this community, I\'ve found strength. Let\'s inspire each other to keep moving forward!',
      'image':
          'https://th.bing.com/th/id/OIP.mlK74o9ZAmQ8Lhh3fccx2gHaE_?rs=1&pid=ImgDetMain',
      'comments': [
        {'username': 'Parag', 'comment': 'You are so strong! Keep inspiring!'},
        {'username': 'Sakhi', 'comment': 'I admire your courage!'},
      ],
      'likes': 25,
    },
    {
      'user': 'Rakesh',
      'title': 'Resource Recommendation',
      'content':
          'I came across an excellent resource for survivors - a local support group that offers counseling and workshops. Check it out: [Support Group Link]. Remember, you are not alone, and help is available!',
      'image':
          'https://e3az4yc7762.exactdn.com/wp-content/uploads/2022/08/PCI-India_Umang-session-1-768x512.jpg?strip=all&lossy=1&ssl=1',
      'comments': [
        {'username': 'Ravi', 'comment': 'Thanks for sharing this resource!'},
        {'username': 'Meera', 'comment': 'I will definitely check it out!'},
      ],
      'likes': 32,
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
          return ForumPostCard(post: dummyPosts[index], onCommentSubmitted: (comment) {
            setState(() {
              dummyPosts[index]['comments'].add({
                'username': 'Me',
                'comment': comment,
              });
            });
          });
        },
      ),
    );
  }
}

class ForumPostCard extends StatefulWidget {
  final Map<String, dynamic> post;
  final Function(String) onCommentSubmitted;

  const ForumPostCard({Key? key, required this.post, required this.onCommentSubmitted}) : super(key: key);

  @override
  _ForumPostCardState createState() => _ForumPostCardState();
}

class _ForumPostCardState extends State<ForumPostCard> {
  bool isLiked = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://www.mebamcb.com/frontassets/images/default.png'),
                ),
                SizedBox(width: 8),
                Text(
                  widget.post['user'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Image.network(
            '${widget.post['image']}', // Replace with your image URL
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite, color: isLiked ? Colors.red : Colors.black),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                          if (isLiked) {
                            widget.post['likes'] += 1;
                          } else {
                            widget.post['likes'] -= 1;
                          }
                        });
                      },
                    ),
                    Text('${widget.post['likes']} likes'),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  widget.post['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(widget.post['content']),
              ],
            ),
          ),
          ExistingComments(comments: widget.post['comments']),
          CommentSection(
            onCommentSubmitted: widget.onCommentSubmitted,
          ),
        ],
      ),
    );
  }
}

class ExistingComments extends StatelessWidget {
  final List<Map<String, String>> comments;

  const ExistingComments({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Comments:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        for (var comment in comments) CommentTile(username: comment['username']!, comment: comment['comment']!),
        SizedBox(height: 8),
      ],
    );
  }
}

class CommentSection extends StatefulWidget {
  final Function(String) onCommentSubmitted;

  const CommentSection({Key? key, required this.onCommentSubmitted}) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  List<Map<String, String>> comments = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    widget.onCommentSubmitted(_commentController.text);
                  }
                },
                child: Text('Post'),
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
          CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage('https://www.mebamcb.com/frontassets/images/default.png'),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(comment),
            ],
          ),
        ],
      ),
    );
  }
}
