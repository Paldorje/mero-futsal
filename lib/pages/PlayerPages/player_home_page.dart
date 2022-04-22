import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';
import 'package:mero_futsal/pages/PlayerPages/team_page.dart';
import 'package:mero_futsal/pages/details_page.dart';
import 'package:mero_futsal/pages/favorite_page.dart';
import 'package:mero_futsal/pages/PlayerPages/my_cart_page.dart';
import 'package:mero_futsal/pages/PlayerPages/player_profile_page.dart';

import '../../models/api.services.dart';

class MyHomePage extends StatefulWidget {
  final String userEmail;
  const MyHomePage({Key? key, required this.userEmail}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Mero Futsal',
              style: style.copyWith(
                  color: Colors.white, fontSize: 18, letterSpacing: 1.5),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const MyCart()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.money,
                      color: bleu,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Pay',
                      style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: bleu),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavorite()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: favouriteArenas.isNotEmpty
                    ? Badge(
                        badgeContent: Text(
                          favouriteArenas.length.toString(),
                          style: style.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: white),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 28,
                        ),
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 28,
                      ),
              ),
            ),
          ],
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
                                color: bleu),
                            unselectedLabelColor: const Color(0xFF959191),
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
                                icon: Icon(Icons.group),
                                text: 'Team',
                              ),
                            ]),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: TabBarView(controller: _controller, children: [
                            FutureBuilder(
                              future: APIServices.fetchFutsals(),
                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                              List<FutsalArenas> allArenas = snapshot.data;
                              return _buildListItem(items: allArenas);}
                              return const Center(child: CircularProgressIndicator());}),
                             PlayerProfilePage(email: widget.userEmail,),
                            const Team(),
                          ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ))));
  }

  Widget _buildListItem({required List<FutsalArenas> items}) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: _buildItem(myItems: items, index: index))
              : BounceInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: _buildItem(myItems: items, index: index));
        });
  }

  Widget _buildItem({required List<FutsalArenas> myItems, required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(
                      item: myItems[index],
                    )));
      },
      child: AspectRatio(
        aspectRatio: 3 / 2.3,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              // color: myItems[index].cost,
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
                    'assets/images/one.png',
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
                          myItems[index].futsalName,
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
                      myItems[index].location,
                      style: style.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    Text(
                      'Rs ${myItems[index].cost}',
                      style: style.copyWith(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
