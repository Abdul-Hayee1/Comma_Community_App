import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenDimensionsProvider = Provider<ScreenDimensions>((ref) {
  throw UnimplementedError();
});

class ScreenDimensions {
  final double width;
  final double height;

  ScreenDimensions({required this.width, required this.height});
}
