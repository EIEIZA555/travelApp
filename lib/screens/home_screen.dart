import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/widgets/destination.dart';
import 'package:mytravel/widgets/profile.dart';
import '../widgets/icon_tab.dart';
import '/constants/colors.dart';
import '/models/data.dart';
import 'package:mytravel/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: primaryColor,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: Text("Travel App",
              style: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              )),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
// Row 1 - Profile
              ProfileWidget(),
              SizedBox(height: 15),
              // Row 2 - Point of Interest
              Row(
                children: [
                  Text(
                    "Point of Interest",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Row 3 - Search Bar
              SearchingBar(),
              SizedBox(
                height: 15,
              ),
              // Row 4 - Icon tab
              IconTab(),
              SizedBox(height: 15),
              // Row 5 - Top Destination
              Row(
                children: [
                  Text(
                    "Top Destinations",
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.tune,
                    size: 25,
                    color: primaryColor,
                  ),
                ],
              ),
              // Row 6 - GridView count
              SizedBox(height: 20),
              GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  children: destinations.map((e) {
                    return AnimationConfiguration.staggeredGrid(
                      position: destinations.indexOf(e),
                      columnCount: 2,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: DestinationWidget(
                            name: e.name,
                            image: e.image,
                            rate: e.rate,
                            location: e.location,
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}


