// import 'package:cocktail_app/drinks_providor.dart';
import 'dart:convert';

import 'package:cocktail_app/drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
  var res;
  dynamic drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)['drinks'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue[300],
          Colors.blue[700].withGreen(100).withBlue(100),
          Colors.blue[300]
        ])),
        child: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    dynamic drinko = drinks[index];
                    var drink = drinks[index]['strDrink'];
                    var id = drinks[index]['idDrink'];
                    var img = drinks[index]['strDrinkThumb'];
                    return ListTile(
                      leading: Hero(
                        tag: id,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(img) ?? Text('N'),
                        ),
                      ),
                      title: Text(
                        drink,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        id,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DrinkDetial(drinko: drinko)),
                        );
                      },
                    );
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
