import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';
import 'package:mero_futsal/pages/myCart_page.dart';
import 'package:mero_futsal/pages/profile_page.dart';

import '../../models/api.services.dart';

class OwnerHomePage extends StatefulWidget {
  @override
  _OwnerHomePageState createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<FutsalArenas> allArenas =
      APIServices.fetchFutsals() as List<FutsalArenas>;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(40, 38, 56, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Mero Futsal',
                style: style.copyWith(
                    color: Colors.white, fontSize: 18, letterSpacing: 1.5),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TabBar(
                  controller: _controller,
                  unselectedLabelStyle: style.copyWith(fontSize: 12),
                  labelStyle: style.copyWith(fontSize: 12),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kPlayerButtonColor),
                  unselectedLabelColor: Color(0xFF959191),
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.home),
                      text: 'Home',
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      text: 'Profile',
                    ),
                    Tab(
                      icon: Icon(Icons.money),
                      text: 'Bookings',
                    ),
                  ]),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(controller: _controller, children: [
                  _buildlistitem(items: allArenas),
                  ProfilePage(),
                  MyCart(),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlistitem({required List<FutsalArenas> items}) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return _builditem(myitems: items, index: index);
        });
  }

  Widget _builditem({required List<FutsalArenas> myitems, required int index}) {
    return AspectRatio(
      aspectRatio: 3 / 2.3,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color(0xFF9E9898),
                  offset: Offset(0, 10))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assest/img1.png',
                  fit: BoxFit.cover,
                  width: 130,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        myitems[index].futsalName,
                        style: style.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    myitems[index].location,
                    style: style.copyWith(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  const Spacer(),
                  Text(
                    ' Rs ${myitems[index].cost} ',
                    style: style.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
