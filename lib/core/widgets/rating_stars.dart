import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  const RatingStars({
    super.key,
    this.initialRating = 0,
    this.starSize = 32,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.onRatingChanged,
  });

  final int initialRating;
  final double starSize;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int>? onRatingChanged;

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  late int rating;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        final starNumber = index + 1;

        return GestureDetector(
          onTap: () {
            setState(() {
              rating = starNumber;
            });

            widget.onRatingChanged?.call(rating);
          },
          child: Icon(
            starNumber <= rating ? Icons.star : Icons.star_border,
            size: widget.starSize,
            color: starNumber <= rating
                ? widget.activeColor
                : widget.inactiveColor,
          ),
        );
      }),
    );
  }
}
