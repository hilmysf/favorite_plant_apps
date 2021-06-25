import 'package:favorite_plant_apps/detail_screen.dart';
import 'package:favorite_plant_apps/model/plant_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color a = Color(0xff25C266);
Color b = Color(0xff37DC9A);
Color c = Color(0xff33333F);
Color d = Color(0xff8E8E93);

class MainScreen extends StatelessWidget {
  final String text;

  MainScreen({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Plants For You',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          Container(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hello, $text!  ",
              textScaleFactor: 1.5,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontFamily: fontFamily
              ),
            ),
          ),
          Container()
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return PlantsGridMobile(
              gridCount: 2,
            );
          } else if (constraints.maxWidth <= 900 &&
              constraints.maxWidth > 600) {
            return PlantsGridWeb(gridCount: 4);
          } else {
            return PlantsGridWeb(
              gridCount: 6,
            );
          }
        },
      ),
    );
  }
}

class PlantsGridMobile extends StatelessWidget {
  final int gridCount;

  PlantsGridMobile({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: plantList.map((plant) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(plant: plant);
                        }));
                      },
                      child: Container(
                        height: 400,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Image.asset(
                                  plant.imageAsset,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            plant.area,
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            plant.name,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            plant.price,
                                            style: TextStyle(
                                              color: a,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ));
                }).toList(),
              ),
            ),
          ),
        ));
  }
}

class PlantsGridWeb extends StatelessWidget {
  final int gridCount;

  PlantsGridWeb({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 6;
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisCount: gridCount,
          mainAxisSpacing: 32,
          crossAxisSpacing: 32,
          children: plantList.map((plant) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(plant: plant);
                }));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Image.asset(
                        plant.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(
                                  plant.area,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  plant.name,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  plant.price,
                                  style: TextStyle(
                                    color: a,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      isAlwaysShown: true,
    );
  }
}
