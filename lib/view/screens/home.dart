import 'package:flutter/material.dart';

import '../../modals/allRounder.dart';
import 'details.dart';

void main() {
  runApp(
    const Home(),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Galaxy Planets",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: planets.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Transform.rotate(
                    angle: 40,
                    // offset: ,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image(
                        image: AssetImage('${planets[i]['img']}'),
                      ),
                    ),
                  ),
                  title: Text(
                    "${planets[i]['name']}",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Details(),
                              settings: RouteSettings(arguments: planets[i])),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.black,
                      )),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
