// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
void main() {
  runApp(const PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  const PictureStoryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  const StoryLibraryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child:Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "      " + storyList[index].title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class StoryViewerScreen extends StatefulWidget {
  StoryViewerScreen({super.key, required this.story});
  final Story story;

  FlutterTts flutterTts = FlutterTts();

  @override
  State<StoryViewerScreen> createState() => _StoryViewerScreen();
}

class _StoryViewerScreen extends State<StoryViewerScreen> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.story.coverImage,
               width: 700,
               height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.story.content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Implement interactive elements or read-aloud functionality
                if (playing) {
                  await widget.flutterTts.pause();
                } else {
                  await widget.flutterTts.speak(widget.story.content);
                }
                setState(() {
                  playing = !playing;
                });
              },
              child: Text(playing ? 'Pause' : 'Read Aloud'),
            ),
          ],
        ),
      ),
    );
  }
}


class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'The Adventure of Alex',
    coverImage: 'assets/str_1.jpg',
    content: 'Hello, adventurous and amazing boys.You are unique, which means there is only one of you in the entire world. Do you know how incredible that is? This planet has billions of people on it, and there is no one like you on it. You have a wonderful way of looking at the world. You are brave, funny, intelligent, and incredible. It would help if you always remembered that. Only you know how to shine the special light inside you, and only you can give that light to others. In this book, you will get to know Alex an Amazing boy who did not dare at first but then courageously conquered their fears. Boy who doubted himself but then showed inner strength. Boy who almost gave up but then discovered their confidence. I am sure that you can do all of this too. But you must start believing in yourself. Even in the difficult moments of your life, you must never forget that you are unique, lovable, and important to this world. This book will help you with that. Boys love this book and it helps them.',
  ),
  Story(
    title: 'Story of Einstien',
    coverImage: 'assets/einstien.jpg',
    content:"A Nobel Prize winner, developer of the theory of relativity, and a musician, Albert Einstein is remembered as being one of the greatest physicists in the history of science. He was born in Germany in 14 March 1879 but moved all around Europe during his young schooling years, studying in Italy, then Munich, Aarau, and Zurich. He spent most of his adult life in Switzerland and in 1901 he obtained Swiss citizenship after renouncing his German citizenship 5 years prior. In 1905 he was awarded a PhD from the University of Zurich and it was in the same year that he published his ‘Annus Mirabilis’ papers. The ‘Annus Mirabilis’ papers were four articles that would go on to change modern physics substantially. Most famously, his equation of relativity E = mc2 was published in the fourth paper. Einstein was only 26 years old at the time, but these four papers quickly made him world famous." ,
  ),
  Story(
    title: 'Story of Issac Newton',
    coverImage: 'assets/newton.jpg',
    content : "Isaac Newton, in full Sir Isaac Newton, (born December 25, 1642 [January 4, 1643, New Style], Woolsthorpe, Lincolnshire, England—died March 20 [March 31], 1727, London), English physicist and mathematician, who was the culminating figure of the Scientific Revolution of the 17th century. In optics, his discovery of the composition of white light integrated the phenomena of colours into the science of light and laid the foundation for modern physical optics. In mechanics, his three laws of motion, the basic principles of modern physics, resulted in the formulation of the law of universal gravitation. In mathematics, he was the original discoverer of the infinitesimal calculus. Newton’s Philosophiae Naturalis Principia Mathematica (Mathematical Principles of Natural Philosophy, 1687) was one of the most important single works in the history of modern science."
  )
 
  // Add more stories here
];