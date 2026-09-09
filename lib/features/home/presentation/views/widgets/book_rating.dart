import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FaIcon(FontAwesomeIcons.solidStar, color: Color(0xffffdd4f)),
        SizedBox(width: 6.3),
        Text('4.8', style: Styles.textStyle16),
        SizedBox(width: 5),
        Text('(2489)', style: Styles.textStyle14),
      ],
    );
  }
}