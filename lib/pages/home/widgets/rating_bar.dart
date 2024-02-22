import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingItem extends StatefulWidget {
  const RatingItem({
    super.key,
    required this.initialRating,
    required this.label,
  });
  final double initialRating;
  final String label;

  @override
  State<RatingItem> createState() => _RatingItemState();
}

class _RatingItemState extends State<RatingItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        RatingBar.builder(
          ignoreGestures: true,
          initialRating: widget.initialRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.grey[400],
          itemCount: 5,
          itemSize: 20.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: const Color(0xffffa300).withAlpha(200),
          ),
          onRatingUpdate: (rating) {},
          updateOnDrag: true,
        ),
      ],
    );
  }
}
