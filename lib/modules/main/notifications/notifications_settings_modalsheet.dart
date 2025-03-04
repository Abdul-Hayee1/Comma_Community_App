import 'package:flutter/material.dart';

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
      return const _NotificationsSettings();
    },
  );
}

class _NotificationsSettings extends StatefulWidget {
  const _NotificationsSettings();
  @override
  _NotificationsSettingsState createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<_NotificationsSettings> {
  bool _emailUpdatesEnabled = true;
  String _emailFrequency = 'dailyDigest';
  bool _mobilePushEnabled = true;
  bool _welcomeSpaceNotifications = true;

  final Map<String, bool> _notificationTypes = {
    'Cheers On Your Stuff': true,
    'Comments On Your Stuff': true,
    'Comments After You': true,
    '@Mentions': true,
    'Streaks': true,
    'Updates From Your Hosts': true,
    'Event Updates and Reminders': true,
    'Poll Answers and Results': true,
    'Activities Relevant to You': true,
    'Activity From Members You Follow': true,
    'Private Chat Messages': true,
    'Space Chat Messages': true,
    'Livestream': true,
    'All Posts': false,
  };

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Notification Methods',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Choose how would you like to be notified.',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile(
                                    value: _emailUpdatesEnabled,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _emailUpdatesEnabled = value;
                                      });
                                    },
                                    activeColor: Colors.green,
                                    activeTrackColor: Colors.green,
                                    inactiveTrackColor: Colors.black,
                                    thumbColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.selected)) {
                                          return Colors.white;
                                        }
                                        return Colors.grey;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Email Updates',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16),
                              child: Text(
                                'You\'ll get emails for the notification types you choose below.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                'Email Frequency',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 10),
                            RadioListTile<String>(
                              title: const Text(
                                'As Activity Happens',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: const Text(
                                'An email will be sent to you every time there\'s new activity.',
                                style: TextStyle(color: Colors.white70),
                              ),
                              value: 'asActivityHappens',
                              groupValue: _emailFrequency,
                              onChanged: (String? value) {
                                setState(() {
                                  _emailFrequency =
                                      value ?? 'asActivityHappens';
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            RadioListTile<String>(
                              title: const Text(
                                'Daily Digest',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: const Text(
                                'A daily digest email will be sent to you at the end of the day with a collection of your notifications from the day. Note that a few time-sensitive notifications may still send as activity happens.',
                                style: TextStyle(color: Colors.white70),
                              ),
                              value: 'dailyDigest',
                              groupValue: _emailFrequency,
                              onChanged: (String? value) {
                                setState(() {
                                  _emailFrequency = value ?? 'dailyDigest';
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.mobile_friendly,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile(
                                    value: _mobilePushEnabled,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _mobilePushEnabled = value;
                                      });
                                    },
                                    activeColor: Colors.green,
                                    activeTrackColor: Colors.green,
                                    inactiveTrackColor: Colors.black,
                                    thumbColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.selected)) {
                                          return Colors.white;
                                        }
                                        return Colors.grey;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Mobile Push',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16),
                              child: Text(
                                'You\'ll get push notifications for the notification types you choose below.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Center(
                      child: SizedBox(
                        width: 125,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Notification Types',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Get updates when you have new...',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ..._notificationTypes.keys.map((key) {
                      return Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          SwitchListTile(
                            title: Text(
                              key,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              _getNotificationDescription(key),
                              style: const TextStyle(color: Colors.white70),
                            ),
                            value: _notificationTypes[key] ?? false,
                            onChanged: (bool value) {
                              setState(() {
                                _notificationTypes[key] = value;
                              });
                            },
                            activeColor: Colors.green,
                            activeTrackColor: Colors.green,
                            inactiveTrackColor: Colors.black,
                            thumbColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.white;
                                }
                                return Colors.grey;
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Center(
                      child: SizedBox(
                        width: 125,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Space Notifications',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'You\'ll receive notifications for the following Spaces based on the settings you chose above. You can also adjust these settings from each individual Space.',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    SwitchListTile(
                      title: const Text(
                        'Welcome!',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: _welcomeSpaceNotifications,
                      onChanged: (bool value) {
                        setState(() {
                          _welcomeSpaceNotifications = value;
                        });
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.black,
                      thumbColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white;
                          }
                          return Colors.grey;
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getNotificationDescription(String key) {
    switch (key) {
      case 'Cheers On Your Stuff':
        return 'Cheers on quick posts, articles, questions, polls, and comments you created.';
      case 'Comments On Your Stuff':
        return 'Comments on quick posts, articles, events, questions, and polls you created, and lessons you created or own.';
      case 'Comments After You':
        return 'Comments after your comment or replies after your reply.';
      case '@Mentions':
        return 'See when other members tag you directly in a post, comment, or chat.';
      case 'Streaks':
        return 'Be notified about your streaks.';
      case 'Updates From Your Hosts':
        return 'Be notified when a Host makes updates in the Network.';
      case 'Event Updates and Reminders':
        return 'Get updates from the event Host, and reminders when the event is about to start.';
      case 'Poll Answers and Results':
        return 'Be notified about the results of your polls.';
      case 'Activities Relevant to You':
        return 'Find out when people near you join, or when there is relevant trending activity.';
      case 'Activity From Members You Follow':
        return 'Keep tabs on all the activity from the members that matter to you.';
      case 'Private Chat Messages':
        return 'Private messages from other members and Hosts.';
      case 'Space Chat Messages':
        return 'Messages from other members in a Space.';
      case 'Livestream':
        return 'We\'ll notify you when a Host starts a livestream anywhere in the Network.';
      case 'All Posts':
        return 'Get notified about every new post. Careful, this can get noisy.';
      default:
        return '';
    }
  }
}
