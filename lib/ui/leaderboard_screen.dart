import 'package:fitness_app/api_client/api_requests.dart';
import 'package:fitness_app/model/showFriend_response.dart';
import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../helper/text_styles.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen> {
  late ShowFriends user;

  var isLoading = true;
  int ages = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getFriendProfile();
    });
  }

  getFriendProfile() async {
    isLoading = true;
    setState(() {});
    user = await getFriends();
    isLoading = false;
    setState(() {});

    print("Users: ${user.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Friend List",
                  style: titleTextStyle,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Compete!",
                    style: descTextStyle,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Leader Board",
                  style: subTitleTextStyle.copyWith(
                    color: kRedColor,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (ctx, i) {
                      return const Divider(
                        color: Colors.white24,
                      );
                    },
                    itemBuilder: (ctx, i) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "${i + 1}. ",
                                style: normalTextStyle,
                              ),
                            ),
                            Text(
                              "${user.data!.friendList![i].friendName}",
                              style: normalTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              "${user.data!.friendList![i].streaks}",
                              style: normalTextStyle.copyWith(
                                color: kRedColor,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.local_fire_department,
                                color: kRedColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: user.data!.friendList!.length,
                  ),
                ),
              ],
            ),
    );
  }
}
