import 'package:fitness_app/api_client/api_requests.dart';
import 'package:fitness_app/model/groups_response.dart';
import 'package:fitness_app/model/showFriend_response.dart';
import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../helper/text_styles.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key, required this.groupI}) : super(key: key);
  final int groupI;
  @override
  State<GroupScreen> createState() => _GroupScreen();
}

class _GroupScreen extends State<GroupScreen> {
  late GroupsResponse groupsResponse;

  var isLoading = true;
  int ages = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getGroups();
    });
  }

  getGroups() async {
    isLoading = true;
    setState(() {});
    groupsResponse = await getGroupsApi();
    isLoading = false;
    setState(() {});

    print("Users: ${groupsResponse.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Groups",
          style: subTitleTextStyle.copyWith(color: kPrimaryColor),
        ),
        backgroundColor: Colors.black12,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(
                  "${groupsResponse.data![widget.groupI].taskName}",
                  style: titleTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Calorie Goal:${groupsResponse.data![widget.groupI].calorieGoals}",
                    style: descTextStyle.copyWith(color: kPrimaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Step Goal:${groupsResponse.data![widget.groupI].stepsGoals}",
                    style: descTextStyle.copyWith(color: kPrimaryColor),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Members",
                      style: subTitleTextStyle.copyWith(
                        color: kRedColor,
                      ),
                    ),
                  ],
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
                                "${groupsResponse.data![widget.groupI].includeUser![i].account!.first.firstname}",
                                style: normalTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                "${groupsResponse.data![widget.groupI].includeUser![i].account!.first.streak}",
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
                      itemCount: groupsResponse.data![widget.groupI].includeUser!.length),
                ),
              ],
            ),
    );
  }
}
