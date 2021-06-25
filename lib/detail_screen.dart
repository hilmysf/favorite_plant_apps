import 'package:favorite_plant_apps/model/plant_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

var informationTextStyle = TextStyle(fontFamily: 'Poppins');
var fontFamily = 'Poppins';
Color a = Color(0xff25C266);
Color b = Color(0xff37dc9a);
Color c = Color(0xff33333F);
Color d = Color(0xff8E8E93);

class DetailScreen extends StatelessWidget {
  final PlantEntity plant;

  DetailScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(plant: plant);
      } else {
        return DetailMobilePage(plant: plant);
      }
    });
  }
}

class DetailMobilePage extends StatelessWidget {
  final PlantEntity plant;

  const DetailMobilePage({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 15 / 16,
                  child: Image.asset(plant.imageAsset, fit: BoxFit.fitWidth),
                ),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          plant.name,
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 30.0, fontFamily: fontFamily),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("DO YOU KNOW?"),
                                    content: Text(
                                      plant.description,
                                      textAlign: TextAlign.justify,
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"))
                                    ],
                                  ));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    child: Text(
                      plant.price,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.bold,
                          color: b),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 0.1,
                            color: Colors.white70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.thermostat_outlined),
                                SizedBox(
                                  height: 40,
                                  width: 10,
                                ),
                                Text(
                                  plant.temperature,
                                  style: informationTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 0.1,
                            color: Colors.white70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.house),
                                SizedBox(
                                  height: 40,
                                  width: 10,
                                ),
                                Text(
                                  plant.area,
                                  style: informationTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Card(
                              elevation: 0.1,
                              color: Colors.white70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.height),
                                  SizedBox(
                                    height: 40,
                                    width: 10,
                                  ),
                                  Text(
                                    plant.height,
                                    style: informationTextStyle,
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final PlantEntity plant;

  const DetailWebPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 100);
    final double itemWidth = size.width / 3;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PLANTS FOR YOU',
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset(
                                plant.imageAsset,
                                height: itemHeight,
                                width: itemWidth,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        elevation: 0.4,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  plant.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  plant.price,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: fontFamily,
                                      color: b),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "Details",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: fontFamily,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  plant.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Card(
                                        elevation: 0.1,
                                        color: Colors.white70,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.thermostat_outlined),
                                            SizedBox(
                                              height: 40,
                                              width: 10,
                                            ),
                                            Text(
                                              plant.temperature,
                                              style: informationTextStyle,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Card(
                                        elevation: 0.1,
                                        color: Colors.white70,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.house),
                                            SizedBox(
                                              height: 40,
                                              width: 10,
                                            ),
                                            Text(
                                              plant.area,
                                              style: informationTextStyle,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Card(
                                          elevation: 0.1,
                                          color: Colors.white70,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.height),
                                              SizedBox(
                                                height: 40,
                                                width: 10,
                                              ),
                                              Text(
                                                plant.height,
                                                style: informationTextStyle,
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
