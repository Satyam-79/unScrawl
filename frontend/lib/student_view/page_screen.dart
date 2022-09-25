import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../futures/fetch_page_result_firebase.dart';
import '../provider/managers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({
    Key? key,
    required this.chapterIndex,
    required this.chapterID,
  }) : super(key: key);

  final int chapterIndex;
  final String chapterID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Page List', style: headingStyle),
                      PandaImage()
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: mainContainerHeight,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child: Consumer<StudentManager>(
                      builder: (context, value, child) {
                        return value.studentObject.chapter[chapterIndex].pages
                                .isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/blankbox.jpeg'),
                                  SizedBox(height: 20),
                                  Text(
                                    'EMPTY!\nAdd Some Pages',
                                    style: title,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : pageList(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkBackgroundColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    imageOption(
                        context, ImageSource.camera, Icons.camera, 'Camera'),
                    imageOption(
                        context, ImageSource.gallery, Icons.image, 'Gallery'),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView pageList(StudentManager value) => ListView.builder(
        itemCount: value.studentObject.chapter[chapterIndex].pages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FetchPageResultFirebase(
                      pageID: value
                          .studentObject.chapter[chapterIndex].pages[index],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: physicalHeight * .027,
                width: physicalWidth * .17,
                decoration: cardDecoration,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Page ${(index + 1).toString()}',
                        softWrap: true,
                        style: title,
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  TextButton imageOption(
    BuildContext context,
    ImageSource source,
    IconData icon,
    String label,
  ) {
    return TextButton.icon(
      onPressed: () {
        Provider.of<PictureManager>(context, listen: false).getPicture(
          source,
          context,
          chapterID,
        );
      },
      icon: Icon(
        icon,
        color: darkBackgroundColor,
      ),
      label: Text(
        label,
        style: TextStyle(color: darkBackgroundColor),
      ),
    );
  }
}
