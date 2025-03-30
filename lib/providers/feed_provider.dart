// ignore_for_file: avoid_print

import 'package:comma_community_app/modules/main/feed/controller/feed_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedNotifier extends StateNotifier<FeedController> {
  FeedNotifier() : super(FeedController());
}

final feedNotifierProvider =
    StateNotifierProvider<FeedNotifier, FeedController>(
  (ref) {
    return FeedNotifier();
  },
);
