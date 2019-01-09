import 'package:try_app/pages/news.dart';
import 'package:try_app/pages/bus/destinationPage.dart';
import 'package:try_app/pages/purchaseHistory.dart';
import 'package:try_app/pages/login.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {

  final drawerItems = [
    new DrawerItem("Destination", Icons.account_circle,),
    new DrawerItem("News & Promotion", Icons.location_on),
    new DrawerItem("My Trips", Icons.attach_money),
    new DrawerItem("Logout", Icons.exit_to_app),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DestinationPage();
      case 1:
        return new News();
      case 2:
        return new MyTrip();
      case 3:
        return new Login();
        break;

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displaySnackBar(context);
        },
        child: Icon(Icons.info_outline)
        ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Muhammad Khairul Aminuddin"),
                accountEmail: new Text("mkhairul94@gmail.com")),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
  _displaySnackBar(BuildContext context) {
  final snackBar = SnackBar(content: Text('Press ≡ for navigation menu'));
  _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
