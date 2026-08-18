import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerBoxes extends StatefulWidget {
  final ValueNotifier<List<XFile>> images;

  const ImagePickerBoxes({super.key, required this.images});

  @override
  State<ImagePickerBoxes> createState() => _ImagePickerBoxesState();
}

class _ImagePickerBoxesState extends State<ImagePickerBoxes> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    final remaining = 3 - widget.images.value.length;

    if (remaining == 0) return;

    final pickedImages = await _picker.pickMultiImage();

    if (pickedImages.isEmpty) return;

    widget.images.value = [
      ...widget.images.value,
      ...pickedImages.take(remaining),
    ];
  }

  void _removeImage(int index) {
    final images = [...widget.images.value];
    images.removeAt(index);
    widget.images.value = images;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<XFile>>(
      valueListenable: widget.images,
      builder: (context, images, child) {
        return Row(
          children: List.generate(3, (index) {
            final hasImage = index < images.length;

            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: _pickImages,
                      child: Container(
                        width: double.infinity,
                        height: 110.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: hasImage
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.file(
                                  File(images[index].path),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 30,
                              ),
                      ),
                    ),
                    if (hasImage)
                      Positioned(
                        top: -6.h,
                        right: -6.w,
                        child: GestureDetector(
                          onTap: () => _removeImage(index),
                          child: Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
