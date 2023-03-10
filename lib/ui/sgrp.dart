import 'package:flutter/material.dart';
import '../helper/text_styles.dart';
import 'create_group_screen.dart';
import '../helper/const.dart';

class grp extends StatelessWidget {
  const grp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Groups",
            style: subTitleTextStyle.copyWith(color: kPrimaryColor),
          ),
          backgroundColor: Colors.black12,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.person_add,
                        size: 50,
                        color: Colors.white54,
                      ),
                      InkWell(
                        child: const Text(
                          "Create Group ",
                          style:
                              TextStyle(color: Colors.cyanAccent, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateGroupScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.group_add,
                        color: Colors.white54,
                        size: 50,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.black38,
                                      hintText: "#Enter_Group_Tag",
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Done'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Text(
                          "Join Group",
                          style:
                              TextStyle(color: Colors.cyanAccent, fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 55),
              const Text(
                "Your Groups",
                style: TextStyle(
                  color: kRedColor,
                  fontSize: 27,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Colors.white12),
                child: Text(">Ma_nibba 0",
                    style: normalTextStyle.copyWith(color: kPrimaryColor)),
              ),
              const SizedBox(height: 15),
              Container(
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Colors.white12),
                child: Text(">Ma_nibba 1",
                    style: normalTextStyle.copyWith(color: kPrimaryColor)),
              ),
              const SizedBox(height: 15),
              Container(
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Colors.white12),
                child: Text(">Ma_nibba 2",
                    style: normalTextStyle.copyWith(color: kPrimaryColor)),
              ),
              const SizedBox(height: 15),
              Container(
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Colors.white12),
                child: Text(">Ma_nibba 3",
                    style: normalTextStyle.copyWith(color: kPrimaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
