// ignore_for_file: avoid_print

import 'package:comma_community_app/modules/main/chat/view/chat_screen.dart';
import 'package:comma_community_app/modules/main/feed/view/post_modal_screen.dart';
import 'package:comma_community_app/modules/main/settings/deactivate_acc_modal.dart';
import 'package:comma_community_app/modules/main/settings/feedback_info.dart';
import 'package:comma_community_app/modules/main/notifications/notifications_settings_modalsheet.dart';
import 'package:comma_community_app/modules/main/settings/personal_settings_modal.dart';
import 'package:comma_community_app/modules/main/profile/edit_profile_modal.dart';
import 'package:comma_community_app/modules/main/profile/view/view_profile.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/custom_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:comma_community_app/modules/main/settings/account_modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAccountModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const AccountSettingsModal();
    },
  );
}

void showPersonalSettingsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const PersonalSettingsModal();
    },
  );
}

void showViewProfileModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const ViewUserProfileModal();
    },
  );
}

void showEditProfileModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 20, 24, 33),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const EditProfileModal();
    },
  );
}

void showNotificationsSettingsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const NotificationsSettings();
    },
  );
}

void showAddNewChatModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const ChatContact_ListModal();
    },
  );
}

void showCommentSectionModal(
  BuildContext context,
  Post post,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const PostModalScreen();
    },
  );
}

void showDeactivateAccountModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const DeactivateAccModal();
    },
  );
}

void showFeedbackandInfoModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const FeedbackandInfoModal();
    },
  );
}

void showSearchOptionsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 24, 33),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hide Muted Conversations",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Show Private Messages Only",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CANCEL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showSearchFiltersModelSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromARGB(255, 20, 24, 33),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "All Spaces",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showSelectProfileModelSheet(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromARGB(255, 20, 24, 33),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  await ref
                      .read(profileNotifierProvider.notifier)
                      .pickAndUpdateImage(true);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Take Photo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  await ref
                      .read(profileNotifierProvider.notifier)
                      .pickAndUpdateImage(false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Photo Library",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showEventsFilterModelSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromARGB(255, 20, 24, 33),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Upcoming",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nearby",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Past",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yours",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showMembersFilterModelSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromARGB(255, 20, 24, 33),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Top",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Near You",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showWelcomeScreenModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 24, 33),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "See Details",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Invite",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Personal Settings",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CANCEL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
