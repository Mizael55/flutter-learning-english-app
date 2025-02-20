import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/regular_verbs_provider.dart';
import 'screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<RegularVerbsProvider>(context, listen: false).getAllVerbs();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.deepPurple,
        title: const TextDecoration(
            text: 'Force your future',
            fontSize: 30,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextDecoration(
                  text: 'What do you want to learn?', fontSize: 25),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width,
                height: size.height * 0.7 + 50,
                child: GridView.count(
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RegularVerbsScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Regular Verbs',
                        color: Colors.deepPurple.withOpacity(0.5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const IrregularVerbScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Irregular Verbs',
                        color: Colors.red.withOpacity(0.45),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PhrasalVerbsScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Phrasal Verbs',
                        color: Colors.green.withOpacity(0.5),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) {
                    //       return const GrammarScreen();
                    //     }));
                    //   },
                    //   child: CardDecoration(
                    //     text: 'Grammar',
                    //     color: Colors.blue.withOpacity(0.5),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const VocabularyScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Voacabulary',
                        color: Colors.yellow.withOpacity(0.5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ExpressionsScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Expressions',
                        color: Colors.orange.withOpacity(0.5),
                      ),
                    ),
                     GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ReadingScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Reading',
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AdvicesScreen();
                        }));
                      },
                      child: CardDecoration(
                        text: 'Tips to learn',
                        color: Colors.brown.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardDecoration extends StatelessWidget {
  const CardDecoration({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextDecoration(text: text, fontSize: 18, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}

class TextDecoration extends StatelessWidget {
  const TextDecoration({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
