import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

/// Service for handling image compression operations
class ImageCompressionService {
  /// Format bytes to a human-readable string
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  /// Compress an image file
  ///
  /// [imageFile] - The original image file to compress
  /// [index] - Optional index for logging purposes
  /// [quality] - Compression quality (0-100), default is 80
  /// [minWidth] - Minimum width in pixels, default is 1080
  /// [minHeight] - Minimum height in pixels, default is 1080
  /// [logSize] - Whether to print size information, default is true
  ///
  /// Returns the compressed file, or null if compression fails
  static Future<File> compressImage(
    File imageFile, {
    int? index,
    int quality = 90,
    int minWidth = 1080,
    int minHeight = 1080,
    bool logSize = true,
  }) async {
    try {
      // Get file size before compression
      final originalSize = await imageFile.length();
      if (logSize) {
        print(
          'Image ${index != null ? index + 1 : ''} - Original size: ${formatFileSize(originalSize)}',
        );
      }

      // Get temporary directory
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final indexSuffix = index != null ? '_$index' : '';
      final targetPath =
          '${tempDir.path}/compressed_$timestamp$indexSuffix.jpg';

      // Compress image
      final result = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path,
        targetPath,
        quality: quality,
        minWidth: minWidth,
        minHeight: minHeight,
      );

      if (result != null) {
        final compressedFile = File(result.path);
        final compressedSize = await compressedFile.length();

        if (logSize) {
          print(
            'Image ${index != null ? index + 1 : ''} - Compressed size: ${formatFileSize(compressedSize)}',
          );

          final reduction =
              ((originalSize - compressedSize) / originalSize * 100)
                  .toStringAsFixed(2);
          print(
            'Image ${index != null ? index + 1 : ''} - Size reduction: $reduction%',
          );
        }

        return compressedFile;
      }

      return imageFile; // Return original if compression fails
    } catch (e) {
      print('Error compressing image ${index != null ? index + 1 : ''}: $e');
      return imageFile; // Return original if compression fails
    }
  }

  /// Compress multiple images
  ///
  /// [images] - List of image files to compress
  /// [quality] - Compression quality (0-100), default is 80
  /// [minWidth] - Minimum width in pixels, default is 1080
  /// [minHeight] - Minimum height in pixels, default is 1080
  /// [logSize] - Whether to print size information, default is true
  ///
  /// Returns list of compressed files
  static Future<List<File>> compressImages(
    List<File> images, {
    int quality = 90,
    int minWidth = 1080,
    int minHeight = 1080,
    bool logSize = true,
  }) async {
    final List<File> compressedImages = [];

    for (int i = 0; i < images.length; i++) {
      final compressed = await compressImage(
        images[i],
        index: i,
        quality: quality,
        minWidth: minWidth,
        minHeight: minHeight,
        logSize: logSize,
      );

      compressedImages.add(compressed);
    }

    return compressedImages;
  }
}
