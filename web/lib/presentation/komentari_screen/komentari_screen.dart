import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/model/comment.dart';
import 'package:slatkizalogaj/services/commnet_service.dart';
import 'package:slatkizalogaj/services/user_service.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';
import 'package:slatkizalogaj/widgets/custom_elevated_button.dart';
import 'package:slatkizalogaj/widgets/custom_text_form_field.dart';
import 'package:slatkizalogaj/widgets/drawer/drawer.dart';

class KomentariScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

// ignore_for_file: must_be_immutable
class _CommentScreenState extends State<KomentariScreen> {
  TextEditingController komentarController = TextEditingController();

  @override
  void dispose() {
    komentarController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final String commentText = komentarController.text;
    // Here you would usually send the comment to your backend or data provider
    print('Submitted comment: $commentText');
    CommentsService.addComment(
        Comment(username: UserService.currentUser.username, text: commentText));
    setState(() {});
    // Clear the input field after submission
    komentarController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      endDrawer: CustomDrawer(),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: CommentsService.comments.length,
                itemBuilder: (context, index) {
                  final comment = CommentsService.comments[index];
                  return CommentWidget(
                      name: comment.username, comment: comment.text);
                })),
        _buildColumn(context),
      ]),
    ));
  }

  /// Section Widget
  Widget _buildColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 21.v),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup3928), fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextFormField(
              controller: komentarController,
              hintText: "Komentar",
              hintStyle: CustomTextStyles.titleMediumBlack900,
              textInputAction: TextInputAction.done,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 21.h, vertical: 12.v)),
          SizedBox(height: 14.v),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 20.h),
                  child: CustomElevatedButton(
                      width: 100.h,
                      text: "Komentariši",
                      onPressed: () {
                        onTapKomentarii(context);
                      }))),
        ]));
  }

  /// Common widget
  Widget _buildStack(
    BuildContext context, {
    required String aleks,
    required String description,
  }) {
    return SizedBox(
        height: 196.v,
        width: 357.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle3786196x377,
              height: 196.v,
              width: 377.h,
              alignment: Alignment.centerRight),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 25.h, top: 29.v, right: 39.h),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Container(
                              width: 40.h,
                              decoration: AppDecoration.fillWhiteA.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder17),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgImage39x40,
                                    height: 39.v,
                                    width: 40.h,
                                    radius: BorderRadius.circular(19.h)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgStar127,
                                    height: 31.v,
                                    width: 40.h,
                                    radius: BorderRadius.circular(15.h),
                                    margin: EdgeInsets.only(
                                        left: 291.h, top: 4.v, bottom: 2.v))
                              ])),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 20.h, top: 4.v, bottom: 3.v),
                              child: Text(aleks,
                                  style: CustomTextStyles
                                      .headlineSmallLatoPrimaryContainer
                                      .copyWith(
                                          color: theme
                                              .colorScheme.primaryContainer)))
                        ]),
                        SizedBox(height: 43.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(description,
                                style: CustomTextStyles
                                    .headlineSmallLatoGray80002
                                    .copyWith(color: appTheme.gray80002)))
                      ])))
        ]));
  }

  /// Navigates to the detaljiScreen when the action is triggered.
  onTapKomentarii(BuildContext context) {
    CommentsService.addComment(Comment(
        username: UserService.currentUser.username,
        text: komentarController.text));
    komentarController.clear();
    setState(() {});
  }
}

class CommentWidget extends StatelessWidget {
  final String name;
  final String comment;

  const CommentWidget({Key? key, required this.name, required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage39x40,
              height: 39.v,
              width: 40.h,
              radius: BorderRadius.circular(19.h)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
