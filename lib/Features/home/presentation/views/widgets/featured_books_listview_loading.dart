import 'package:bookly/Features/home/presentation/views/widgets/custom_books_image_loading.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';

class FeaturedBooksListViewLoading extends StatelessWidget {
  const FeaturedBooksListViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(

      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child:CustomBookImageLoading(),
            );
          },
        ),
      ),
    );
  }
}
