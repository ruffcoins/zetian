import 'package:flutter/material.dart';

// To be displayed when there's reception issue.
class NoNetwork extends StatelessWidget {
  const NoNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Card(
            child: Column(
              children: [
                Icon(Icons.error, size: MediaQuery.of(context).size.aspectRatio * 200,),
                Text("No internet connection",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text("Please connect to a Mobile Network or Wifi or Logout to retry",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
