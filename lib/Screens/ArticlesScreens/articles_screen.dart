import 'package:breed_me/Custom%20Widgets/custom_article_container.dart';
import 'package:breed_me/Models/article.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  List<Article> articles = [
    Article(
        "Food",
        "Food effect on Dogs",
        "It's much more difficult to play tennis with a bowling ball than it is to bowl with a tennis ball.\n  She wasn't sure whether to be impressed or concerned that he folded underwear in neat little packages.\nIt was always dangerous to drive with him since he insisted the safety cones were a slalom course.\nWe have a lot of rain in June.\nThe toy brought back fond memories of being lost in the rain forest.\nHe figured a few sticks of dynamite were easier than a fishing pole to catch fish.\nTruth in advertising and dinosaurs with skateboards have much in common.\nGreen should have smelled more tranquil, but somehow it just tasted rotten.\nThey improved dramatically once the lead singer left.\nThe tattered work gloves speak of the many hours of hard labor he endured throughout his life.\nHe swore he just saw his sushi move.\nHe had a hidden stash underneath the floorboards in the back room of the house.\nI am happy to take your donation; any amount will be greatly appreciated.\nShe works two jobs to make ends meet; at least, that was her reason for not having time to join us.\nHe found rain fascinating yet unpleasant.",
        "assets/images/5.jpg",
        DateTime.now()),
    Article(
        "Not Food",
        "Not Food effect on Dogs",
        "It's much more difficult to play tennis with a bowling ball than it is to bowl with a tennis ball.\n  She wasn't sure whether to be impressed or concerned that he folded underwear in neat little packages.\nIt was always dangerous to drive with him since he insisted the safety cones were a slalom course.\nWe have a lot of rain in June.\nThe toy brought back fond memories of being lost in the rain forest.\nHe figured a few sticks of dynamite were easier than a fishing pole to catch fish.\nTruth in advertising and dinosaurs with skateboards have much in common.\nGreen should have smelled more tranquil, but somehow it just tasted rotten.\nThey improved dramatically once the lead singer left.\nThe tattered work gloves speak of the many hours of hard labor he endured throughout his life.\nHe swore he just saw his sushi move.\nHe had a hidden stash underneath the floorboards in the back room of the house.\nI am happy to take your donation; any amount will be greatly appreciated.\nShe works two jobs to make ends meet; at least, that was her reason for not having time to join us.\nHe found rain fascinating yet unpleasant.",
        "assets/images/6.jpg",
        DateTime.now()),

    Article(
        "Smile",
        "Smile",
        "It's much more difficult to play tennis with a bowling ball than it is to bowl with a tennis ball.\n  She wasn't sure whether to be impressed or concerned that he folded underwear in neat little packages.\nIt was always dangerous to drive with him since he insisted the safety cones were a slalom course.\nWe have a lot of rain in June.\nThe toy brought back fond memories of being lost in the rain forest.\nHe figured a few sticks of dynamite were easier than a fishing pole to catch fish.\nTruth in advertising and dinosaurs with skateboards have much in common.\nGreen should have smelled more tranquil, but somehow it just tasted rotten.\nThey improved dramatically once the lead singer left.\nThe tattered work gloves speak of the many hours of hard labor he endured throughout his life.\nHe swore he just saw his sushi move.\nHe had a hidden stash underneath the floorboards in the back room of the house.\nI am happy to take your donation; any amount will be greatly appreciated.\nShe works two jobs to make ends meet; at least, that was her reason for not having time to join us.\nHe found rain fascinating yet unpleasant.",
        "assets/images/2.jpg",
        DateTime.now()),
    Article(
        "Care",
        "Care",
        "It's much more difficult to play tennis with a bowling ball than it is to bowl with a tennis ball.\n  She wasn't sure whether to be impressed or concerned that he folded underwear in neat little packages.\nIt was always dangerous to drive with him since he insisted the safety cones were a slalom course.\nWe have a lot of rain in June.\nThe toy brought back fond memories of being lost in the rain forest.\nHe figured a few sticks of dynamite were easier than a fishing pole to catch fish.\nTruth in advertising and dinosaurs with skateboards have much in common.\nGreen should have smelled more tranquil, but somehow it just tasted rotten.\nThey improved dramatically once the lead singer left.\nThe tattered work gloves speak of the many hours of hard labor he endured throughout his life.\nHe swore he just saw his sushi move.\nHe had a hidden stash underneath the floorboards in the back room of the house.\nI am happy to take your donation; any amount will be greatly appreciated.\nShe works two jobs to make ends meet; at least, that was her reason for not having time to join us.\nHe found rain fascinating yet unpleasant.",
        "assets/images/7.jpg",
        DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                for (int index = 0; index < 4; index++)
                  CustomArticleContainer(
                    article: articles[index],
                  ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
