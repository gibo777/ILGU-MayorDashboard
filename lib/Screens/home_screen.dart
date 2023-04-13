import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006DD1),
        centerTitle: true, // add this line to center the title
        title: Text(
          'ILGU ONLINE DASHBOARD - CITY OF BACOOR',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement profile icon onPressed action
            },
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              // TODO: Implement notification icon onPressed action
            },
          ),
          IconButton(
            icon: Icon(Icons.person_pin),
            onPressed: () {
              // TODO: Implement profile icon onPressed action
            },
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            color: Color(0xFF006DD1),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 125.0,
                        height: 125.0,
                        child: Image.asset(
                          'assets/images/bacoor_logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text('Mayor',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    // TODO: Add navigation to the settings screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart_sharp, color: Colors.white),
                  title: Text('Treasury',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    // TODO: Add navigation to the settings screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Logout',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to log out?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Logout'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3, // number of columns
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 1,
        children: [
          _buildBox('Accounting and financing', 'P 3,231,321.00', context),
          _buildBox('Library', 'Some content', context),
          _buildBox('Shop', 'Some content', context),
          _buildBox('Music', 'Some content', context),
          _buildBox('Movies', 'Some content', context),
        ],
      ),
    );
  }

  Widget _buildBox(String title, String subtitle, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement onTap action
      },
      child: Container(
        height: 150 ,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
