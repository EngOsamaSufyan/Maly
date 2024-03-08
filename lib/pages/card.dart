import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../model/balance_model.dart';
import 'dart:async' show Future;


class MalyCard extends StatefulWidget {
  @override
  State<MalyCard> createState() => _MalyCardState();
}

class _MalyCardState extends State<MalyCard> {
  bool isBalanceVisible = false;

  void toggleBalanceVisibility() {
    setState(() {
      isBalanceVisible = !isBalanceVisible;
    });
  }
   List<MalyCard> data = [];
  String? name;
  String? number;
  String? balance;
  String? expires;

  @override
  void initState() {
    super.initState();
    _loddata();
  }

  Future<String>_readjson()async{
      String jsonData = await rootBundle.loadString('assets/json/balance.json');
      return jsonData ;
  }
  Future<List<CardModel>>   _parsejson(String jsonString)async{
    final jsonData = json.decode(jsonString)as List<dynamic>;
    final objects = jsonData .map((e)=>CardModel.fromJson(e as Map<String,dynamic>)).toList();
    return objects;
  }
  Future <void>_loddata ()async{
    String jsonString =await _readjson();
    Map<String,dynamic>jsonData =(await _parsejson(jsonString)) as Map<String, dynamic>;
    setState(() {
      name=jsonData['card_name'];
      number=jsonData['card_number'];
      balance=jsonData['balance'];
      expires=jsonData['expiry_date'];

    });
  }
  // Future<void> _loadJsonData() async {
  //   String jsonData = await rootBundle.loadString('assets/json/balance.json');
  //   Map<String, dynamic> jsonMap = jsonDecode(jsonData);
  //   List<dynamic> dataList = jsonMap['data'];
  //   List<CardModel> cardList =
  //   dataList.map((json) => CardModel.fromJson(json)).toList();
  //
  //   setState(() {
  //     data = cardList;
  //     name = cardList.isNotEmpty ? cardList[0].cardName : null;
  //     number = cardList.isNotEmpty ? cardList[0].cardNumber : null;
  //     balance = cardList.isNotEmpty ? cardList[0].balance.toString() : null;
  //     expires = cardList.isNotEmpty ? cardList[0].expiryDate : null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 390,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white10,
            Colors.white,
            Colors.blueGrey,
            Colors.blueGrey,
            Colors.blueGrey,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png', // Replace with your card logo image
                  width: 70,
                  height: 50,
                ),
                Text(
                  number ?? 'Loading...', // Show loading indicator if number is null
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Card Holder',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(name ?? 'Loading...'), // Show loading indicator if name is null
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expires',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(expires ?? 'Loading...'), // Replace with card expiration date
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:      Row(
                    children: [
                      isBalanceVisible
                          ? Text(
                    balance?? 'Loading...',
                        style: TextStyle(fontSize: 15),
                      )
                          : Text(
                        '***',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(
                          isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.orange,
                        ),
                        onPressed: toggleBalanceVisibility,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
