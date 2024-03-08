import 'package:flutter/material.dart';

class MoneyReceivePage extends StatefulWidget {
  @override
  State<MoneyReceivePage> createState() => _MoneyReceivePageState();
}

class _MoneyReceivePageState extends State<MoneyReceivePage> {
  final TextEditingController accountController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  String? selectedCurrency;



  List<String> Currency = [
    'Electricity',
    'Water',
    'Telephone',
    'Internet',
    'Phone Credit',
    'Purchases',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.black12,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text('Money Receive ',
                style: TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 16),

              Container(
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:   DropdownButton<String>(
                    hint: Text('Select a Currency'),
                    value: selectedCurrency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCurrency = newValue;
                      });
                    },
                    items: Currency.map((service) {
                      return DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.numbers),
                      onPressed: () {
                        // Handle search button click
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: accountController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Number of Transfer ...',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              MaterialButton(
                  elevation: 100.0,
                  color: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50
                  ),
                  child: const Text('Receve Money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,

                  ),

                    onPressed: () {
                      // Process the received money
                      String account = accountController.text;
                      String amount = amountController.text;
                      // Add your logic here for processing the received money

                      // Show a dialog or snackbar to indicate success
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Money Received'),
                            content: Text('Account: $account\nAmount: $amount'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
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
    );
  }
}