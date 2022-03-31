import 'package:flutter/material.dart';

class team extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                title: Text('Teammate\'s name' ),
                subtitle: Text('Position'),
                leading: Container(
                  height: 75,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(150),
                    image:  const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/one.png'),
                    ),
                  ),
                ),
                trailing: const Text('Contact No'),
              ),
            );
          },
        )
    );
  }
}