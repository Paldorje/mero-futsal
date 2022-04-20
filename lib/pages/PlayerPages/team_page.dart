import 'package:flutter/material.dart';
import 'package:mero_futsal/models/api.services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/user.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIServices.fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            List<User> allUsers = snapshot.data;
            return buildListView(items: allUsers);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

ListView buildListView({required List<User> items}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: items.length,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, i) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              _buildItem(myItems: items, index: i),
              Container(
                width: 350,
                height: 30,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      // color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildItem({required List<User> myItems, required int index}) {
  return ListTile(
    title: Text(myItems[index].name),
    subtitle: Text(myItems[index].email),
    leading: Container(
      height: 75,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(150),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/one.png'),
        ),
      ),
    ),
    trailing: TextButton(
      onPressed: () {
        var phone = myItems[index].phone;
        launch('tel:+977 $phone');
      },
      child: Text(myItems[index].phone),
    ),
  );
}
