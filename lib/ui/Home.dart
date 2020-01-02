import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;

  void handleRadioValeChanged(int value) {
    setState(() {
     radioValue = value;
     switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          break;
        case 3:
          _finalResult = calculateWeight(_weightController.text, 2.34);
          break;
        case 4:
          _finalResult = calculateWeight(_weightController.text, 1.06);
          break;
        case 5:
          _finalResult = calculateWeight(_weightController.text, 0.92);
          break;
        case 6:
          _finalResult = calculateWeight(_weightController.text, 1.19);
          break;
        case 7:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          break;
     }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Me at Planet X"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade700,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'assets/images/planet.jpg',
              width: 100,
            ),
            new Container(
              margin: const EdgeInsets.all(2.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: "In Kilogram",
                      icon:  new Icon(Icons.person),
                      fillColor: Colors.white
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0),),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.orangeAccent,
                      ),
                      new Text(
                        "Mercury",
                        style: new TextStyle(color: Colors.white)
                      ),
                      new Radio<int>(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.redAccent,
                      ),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white)
                      ),
                      new Radio<int>(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.red,
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 3,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.red,
                      ),
                      new Text(
                        "Jupiter",
                        style: new TextStyle(color: Colors.white)
                      ),
                      new Radio<int>(
                        value: 4,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.white,
                      ),
                      new Text(
                        "Saturn",
                        style: new TextStyle(color: Colors.white)
                      ),
                      new Radio<int>(
                        value: 5,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.pink,
                      ),
                      new Text(
                        "Uranus",
                        style: new TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 6,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.lightGreen,
                      ),
                      new Text(
                        "Neptune",
                        style: new TextStyle(color: Colors.white)
                      ),
                      new Radio<int>(
                        value: 7,
                        groupValue: radioValue,
                        onChanged: handleRadioValeChanged,
                        activeColor: Colors.yellowAccent,
                      ),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6),),
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : "${_finalResult.toStringAsFixed(1)} kg",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty) {
      if (int.parse(weight) > 0) {
        return int.parse(weight) * multiplier;
      }else{
        print("Weight should be above zero");
        return int.parse("100") * 0.38;
      }
    }else{
      print("Wrong input");
      return int.parse("100") * 0.38;
    }
  }
}