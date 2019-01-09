import 'package:flutter/material.dart';

class MyTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: "Upcoming",
              ),
              Tab(
                text: "History",
              ),
            ],
          ),
          body: TabBarView(
            children: [
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  Divider(),
                  const Text('Ticket No: ' + 'R3523', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('Date: 14/3/2019'),
                  const Text('Time: 1.00PM'),
                  const Text('Seat No: A2'),
                  const Text('RM45.00'),
                  Divider(),
                  const Text('Ticket No: ' + 'R4332', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('Date: 22/3/2019'),
                  const Text('Time: 6.30PM'),
                  const Text('Seat No: A7'),
                  const Text('RM45.00'),
                  Divider(),
                  const Text('Ticket No: ' + 'R3822', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('Date: 17/4/2019'),
                  const Text('Time: 8.00PM'),
                  const Text('Seat No: C1'),
                  const Text('RM45.00'),
                  Divider()
                ],
              ),ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  Divider(),
                  const Text('Ticket No: ' + 'R3523', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('Date: 14/3/2019'),
                  const Text('Time: 1.00PM'),
                  const Text('Seat No: A2'),
                  const Text('RM45.00'),
                  Divider(),
                  const Text('Ticket No: ' + 'R4332', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('Date: 22/3/2019'),
                  const Text('Time: 6.30PM'),
                  const Text('Seat No: A7'),
                  const Text('RM45.00'),
                  Divider(),
                ],
              ),],
          ),
        ),
      ),
    );
  }
}
