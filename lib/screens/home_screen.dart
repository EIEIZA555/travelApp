import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/widgets/destination.dart';
import 'package:mytravel/widgets/profile.dart';
import '../widgets/icon_tab.dart';
import '/constants/colors.dart';
//import '/models/data.dart';
import 'package:mytravel/widgets/search_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // new

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List destinationAPI = [];
  bool isLoading = true;

  
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      setState(() {
        destinationAPI = json.decode(response.body);
        isLoading = false;
        // print(destinationAPI);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

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
                  children: List.generate(destinationAPI.length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: DestinationWidget(
                            name: destinationAPI[index]["name"],
                            image: destinationAPI[index]["image"],
                            rate: destinationAPI[index]["rate"].toString(),
                            location: destinationAPI[index]["location"],
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


