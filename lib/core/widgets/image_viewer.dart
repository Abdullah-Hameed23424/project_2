import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/widgets/cached_image.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
    required this.imageUrl,
    this.imageUrls,
    this.initialIndex,
  });

  // For backward compatibility - single image
  final String imageUrl;

  // For multi-image support
  final List<String>? imageUrls;
  final int? initialIndex;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController _pageController;
  late int _currentIndex;
  late List<String> _images;

  @override
  void initState() {
    super.initState();
    // Support both single image and multi-image
    if (widget.imageUrls != null && widget.imageUrls!.isNotEmpty) {
      _images = widget.imageUrls!;
      _currentIndex = (widget.initialIndex ?? 0).clamp(0, _images.length - 1);
    } else {
      _images = [widget.imageUrl];
      _currentIndex = 0;
    }
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: AppColors.white,
        title: _images.length > 1
            ? Text(
                '${_currentIndex + 1} / ${_images.length}',
                style: const TextStyle(color: AppColors.white),
              )
            : null,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Center(
              child: Hero(
                tag: _images[index],
                child: CachedImage(_images[index], fit: BoxFit.contain),
              ),
            ),
          );
        },
      ),
    );
  }
}
