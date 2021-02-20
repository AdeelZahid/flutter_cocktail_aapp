import 'package:flutter/material.dart';

class DrinkDetial extends StatelessWidget {
  final dynamic drinko;

  const DrinkDetial({
    Key key,
    @required this.drinko,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: Text(drinko['strDrink']),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue[300], Colors.blue, Colors.blue[300]])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drinko["idDrink"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(drinko["strDrinkThumb"]),
                ),
              ),
              Text(
                'ID: ${drinko['idDrink']}',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  ' ${drinko['strDrink']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
