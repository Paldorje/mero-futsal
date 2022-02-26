import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/pages/checkout_page.dart';

class MyCart extends StatefulWidget {

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'My Bookings',
            style: style.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: bookedGround.isNotEmpty
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: _screenheight * .4,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: bookedGround.length,
                        itemBuilder: (context, index) {
                          return index % 2 == 0
                              ? BounceInLeft(
                              child: _buildcartitem(index: index))
                              : BounceInRight(
                              child: _buildcartitem(index: index));
                        })),
                const SizedBox(
                  height: 39,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: _screenwidth * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bleu),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CheckoutPage(
                                        cartModel: bookedGround,
                                      )));
                            },
                            child: Text(
                              'Chekout',
                              style: style.copyWith(
                                  color: white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Total = \$$total',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: style.copyWith(
                              fontSize: 14, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
                : Center(
              child: Text(
                'Nothing To Show',
                style: style.copyWith(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildcartitem({required int index}) {
    return Dismissible(
      key: Key(bookedGround[index].name),
      onDismissed: (dir) {
        setState(() {
          total = total - bookedGround[index].price;
          bookedGround.remove(bookedGround[index]);
        });
      },
      background: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.delete,
          color: white,
          size: 40,
        ),
        alignment: Alignment.centerLeft,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
                offset: Offset(0, 10),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: bookedGround[index].color),
                child: Image.asset(
                  bookedGround[index].img,
                  fit: BoxFit.cover,
                  width: 80,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    bookedGround[index].name,
                    maxLines: 1,
                    style: style.copyWith(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    '\$${bookedGround[index].price}',
                    maxLines: 1,
                    style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    'Items : ${bookedGround[index].items}',
                    style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _additems(
                  item: bookedGround[index].items,
                  index: index,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Time:${bookedGround[index].size}',
                  maxLines: 1,
                  style: style.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _additems({required int item, required int index}) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              final originalprice =
                  bookedGround[index].price / bookedGround[index].items;

              bookedGround[index].items++;

              bookedGround[index].price =
                  originalprice * bookedGround[index].items;
              total = total + originalprice;
            });
          },
          child: Text('+',
              style: style.copyWith(
                fontSize: 20,
              )),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.black,
          ),
          child: Text(item.toString(),
              style: style.copyWith(
                fontSize: 12,
              )),
        ),
        InkWell(
          onTap: () {
            setState(() {
              final originalprice =
                  bookedGround[index].price / bookedGround[index].items;

              if (bookedGround[index].items > 1) {
                bookedGround[index].items--;
                bookedGround[index].price =
                    bookedGround[index].price - originalprice;

                total = total - originalprice;
              }
            });
          },
          child: Text('-',
              style: style.copyWith(fontSize: 20, fontWeight: FontWeight.w900)),
        ),
      ],
    );
  }
}