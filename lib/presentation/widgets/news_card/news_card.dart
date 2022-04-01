import 'package:flutter/material.dart';
import 'package:news_api/constants/strings.dart';
import 'package:news_api/constants/strings_manpilation.dart';
import 'package:news_api/data/local_database/database_helper.dart';
import 'package:news_api/data/models/article_model.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets.dart';

class NewsCard extends StatefulWidget {
  final bool isBookmarks;
  final Article article;
  const NewsCard({
    Key? key,
    required this.article,
    this.isBookmarks = false,
  }) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isShowDescription = false;
  final Radius radius = const Radius.circular(12);
  bool isPressed = false;

// function to go to details screen if show details button is clicked
  void goToDetailsScreen(BuildContext context, String articalUrl) {
    Navigator.pushNamed(
      context,
      detailsScreen,
      arguments: articalUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 12,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onLongPress: () {
              setState(() {
                isShowDescription = !isShowDescription;
              });
            },
            onTap: () {
              goToDetailsScreen(context, widget.article.url ?? "");
            },
            child: Column(
              children: [
                NewsCardImage(
                  height: height,
                  radius: radius,
                  imageUrl: widget.article.urlToImage,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: radius,
                      bottomRight: radius,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.title ?? "",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isShowDescription
                          ? DetailsDescription(
                              description: widget.article.description ?? "")
                          : SizedBox(),
                      widget.article.source?.name != null
                          ? SourceWidget(
                              color: Colors.grey.shade400,
                              icon: Icons.account_circle_sharp,
                              title: StringsManpilation.title(
                                StringsManpilation.sourceNameFromDomain(
                                    widget.article.author ??
                                        widget.article.source?.name),
                              ),
                              date: StringsManpilation.date(
                                  widget.article.publishedAt ?? ""),
                            )
                          : const SizedBox(),
                      DetailsButton(
                        onPressed: () {
                          goToDetailsScreen(context, widget.article.url ?? "");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              BookmarkOrDeletButton(
                isBookmarks: widget.isBookmarks,
                onPressed: onPressed,
              ),
              ShareButton(
                onPressed: () async {
                  Share.share(widget.article.url!);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onPressed() {
    if (widget.isBookmarks) {
      LocalDbHelper.instance.delete(widget.article.id!);
      ScaffoldMessenger.of(context).showSnackBar(
        ToastBar(
          text: "Article Deleted From Bookmarks",
        ),
      );
    } else {
      LocalDbHelper.instance.saveArticle(widget.article);
      ScaffoldMessenger.of(context).showSnackBar(
        ToastBar(
          text: "Article Added To Bookmarks",
        ),
      );
    }
  }
}
