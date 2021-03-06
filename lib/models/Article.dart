import 'package:flutter/material.dart';

class Article with ChangeNotifier {
  final String id;
  final String title;
  final String imgPath;
  final String author;
  final String authorImg;
  final String timestamp;
  final String readTime;
  final String body;
  final int noOfLikes;
  final int noOfComments;
  final bool bookmarked;

  Article({
    required this.id,
    required this.title,
    required this.imgPath,
    required this.author,
    required this.authorImg,
    required this.timestamp,
    required this.readTime,
    required this.body,
    required this.noOfLikes,
    required this.noOfComments,
    required this.bookmarked,
  });

  factory Article.fromMap(id, map) {
    return Article(
      id: id,
      title: map['title'],
      imgPath: "assets/available-doctors/doctor-large-img.png",
      author: map['author'],
      authorImg: "assets/available-doctors/doctor-large-img.png",
      timestamp: map['timestamp'],
      readTime: map['readTime'],
      body: map['body'],
      noOfLikes: map['noOfLikes'],
      noOfComments: map['noOfComments'],
      bookmarked: map['bookmarked'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imgPath': imgPath,
      'author': author,
      'authorImg': authorImg,
      'timestamp': timestamp,
      'readTime': readTime,
      'body': body,
      'noOfLikes': noOfLikes,
      'noOfComments': noOfComments,
      'bookmarked': bookmarked,
    };
  }
}

class Articles with ChangeNotifier {
  List<Article> get items {
    return [..._items];
  }

  void setArticles(dynamic articles) {
    _items = articles;

    notifyListeners();
  }

  bookmarkArticle(String id, bool bookmark) {
    _items = items.map((element) => element.id == id
        ? Article(
            id: element.id,
            title: element.title,
            imgPath: element.imgPath,
            author: element.author,
            authorImg: element.authorImg,
            timestamp: element.timestamp,
            readTime: element.readTime,
            body: element.body,
            noOfLikes: element.noOfLikes,
            noOfComments: element.noOfComments,
            bookmarked: bookmark,
          )
        : element);

    notifyListeners();
  }

  dynamic _items = [
    Article(
      id: "1",
      title: "How Sunlight, the Immune System, and Covid-19 Interact",
      body:
          "For thousands of years, humans have recognized that the sun plays a role in the emergence and transmission of viruses",
      imgPath: "assets/articles/article-1.png",
      author: "Markham Heid",
      authorImg: "assets/available-doctors/doctor-2.png",
      readTime: "10 min read",
      timestamp: "20 Nov",
      noOfLikes: 100,
      noOfComments: 45,
      bookmarked: false,
    ),
    Article(
      id: "2",
      title: "The Science Behind Improving Your Immune System",
      body:
          "Today i will talk about that science about your immune system that nobody ever talk about",
      imgPath: "assets/articles/article-2.png",
      author: "Dr. Christine Bradstreet",
      authorImg: "assets/available-doctors/doctor-2.png",
      readTime: "7 min read",
      timestamp: "20 Nov",
      noOfLikes: 100,
      noOfComments: 45,
      bookmarked: false,
    ),
    Article(
      id: "3",
      title: "6 Habits of Highly Healthy Brains",
      body: "Key lifestyle habits that can help keep your brain healthy.",
      imgPath: "assets/articles/article-1.png",
      author: "Thomas Oppong",
      authorImg: "assets/available-doctors/doctor-2.png",
      readTime: "5 min read",
      timestamp: "20 Nov",
      noOfLikes: 100,
      noOfComments: 45,
      bookmarked: false,
    ),
  ];
}
