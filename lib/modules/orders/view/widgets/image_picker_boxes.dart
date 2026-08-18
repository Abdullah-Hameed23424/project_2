import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerBoxes extends StatefulWidget {
  const ImagePickerBoxes({super.key});

  @override
  State<ImagePickerBoxes> createState() => _ImagePickerBoxesState();
}

class _ImagePickerBoxesState extends State<ImagePickerBoxes> {
  final ImagePicker _picker = ImagePicker();

  final List<XFile> _images = [];

  Future<void> _pickImages() async {
    final remaining = 3 - _images.length;

    if (remaining == 0) return;

    final pickedImages = await _picker.pickMultiImage();

    if (pickedImages.isEmpty) return;

    setState(() {
      _images.addAll(pickedImages.take(remaining));
    });
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        final hasImage = index < _images.length;

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
                              File(_images[index].path),
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
  }
}
