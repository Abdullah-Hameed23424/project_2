import 'package:flutter/material.dart';
import 'package:project_2/core/constants/dimensions.dart';
import 'package:project_2/core/widgets/shimmer_card.dart';

class CommonRequestShimmer extends StatelessWidget {
  final bool showButtons;
  const CommonRequestShimmer({super.key, this.showButtons = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.autoSize(16),
        vertical: Dimensions.autoSize(16),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.autoSize(8.75)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShimmerCard(
                width: Dimensions.autoSize(60),
                height: Dimensions.autoSize(60),
                borderRadius: BorderRadius.circular(Dimensions.autoSize(8)),
              ),
              SizedBox(width: Dimensions.autoSize(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShimmerCard(
                      height: Dimensions.autoSize(16),
                      width: Dimensions.autoSize(120),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    SizedBox(height: Dimensions.autoSize(8)),
                    ShimmerCard(
                      height: Dimensions.autoSize(14),
                      width: Dimensions.autoSize(180),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    SizedBox(height: Dimensions.autoSize(8)),
                    ShimmerCard(
                      height: Dimensions.autoSize(14),
                      width: Dimensions.autoSize(100),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: Dimensions.autoSize(24)),
          Row(
            children: <Widget>[
              ShimmerCard(
                height: Dimensions.autoSize(16),
                width: Dimensions.autoSize(16),
                borderRadius: BorderRadius.circular(8),
              ),
              SizedBox(width: Dimensions.autoSize(6)),
              ShimmerCard(
                height: Dimensions.autoSize(14),
                width: Dimensions.autoSize(150),
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          SizedBox(height: Dimensions.autoSize(12)),
          Row(
            children: <Widget>[
              ShimmerCard(
                height: Dimensions.autoSize(16),
                width: Dimensions.autoSize(16),
                borderRadius: BorderRadius.circular(8),
              ),
              SizedBox(width: Dimensions.autoSize(6)),
              ShimmerCard(
                height: Dimensions.autoSize(14),
                width: Dimensions.autoSize(200),
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          if (showButtons) ...[
            SizedBox(height: Dimensions.autoSize(12)),
            Row(
              children: <Widget>[
                Expanded(
                  child: ShimmerCard(
                    height: Dimensions.autoSize(42),
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: Dimensions.autoSize(33)),
                Expanded(
                  child: ShimmerCard(
                    height: Dimensions.autoSize(42),
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
