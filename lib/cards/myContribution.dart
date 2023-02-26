// ignore_for_file: camel_case_types, unused_local_variable, file_names

import 'package:flutter/material.dart';

List activeItems = [
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),
  
];
List totalItems = [
  const contributionCard(),
  const contributionCard(),
  const contributionCard(),

];

class MyContributionPage extends StatefulWidget {
  const MyContributionPage({Key? key}) : super(key: key);

  @override
  State<MyContributionPage> createState() => _MyContributionPageState();
}

class _MyContributionPageState extends State<MyContributionPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: const BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: const Text(
                "My Contribution",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffeeeeee),
                    maxRadius: size.width * 0.1,
                    child: Text("${activeItems.length}"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                const Text(
                  "Contribution",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffEEEEEE),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0)),
                    labelColor: Colors.blue,
                    tabs: const [
                      Tab(
                        text: "Active",
                      ),
                      Tab(
                        text: "Total",
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.only(bottom: size.height*0.4),
                  child: const TabBarView(
                    children: [ActiveTab(), totalTab()],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
}

class ActiveTab extends StatefulWidget {
  const ActiveTab({Key? key}) : super(key: key);

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: activeItems.length,
      itemBuilder: (BuildContext context, int index) => activeItems[index],
    );
  }
}

class totalTab extends StatefulWidget {
  const totalTab({Key? key}) : super(key: key);

  @override
  State<totalTab> createState() => _totalTabState();
}

class _totalTabState extends State<totalTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: totalItems.length,
      itemBuilder: (BuildContext context, int index) => totalItems[index],
    );
  }
}

class contributionCard extends StatelessWidget {
  const contributionCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffEEEEEE),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(84, 84, 84, 0.25),
          //     offset: Offset(0.0, 4.0), //(x,y)
          //     blurRadius: 16.0,
          //   ),
          // ],
        ),
        padding: const EdgeInsets.all(30.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/pic.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "Small pit",
                    style: TextStyle(
                      color: Color(0xff7A7A7A),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "123 Anywhere Street,\nAny City, States",
                    style: TextStyle(
                      color: Color(0xff7A7A7A),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
