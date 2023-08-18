import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator {
  final spinkit = SpinKitThreeBounce(
    size: 10,
    itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.orange,
          ]),
        ),
      );
    },
  );
  final loadingIndicator = const SpinKitFoldingCube(
    color: Colors.deepOrangeAccent,
  );
  final waitingIndicator = const SpinKitDualRing(
    color: Color(0xffB8FF01),
    size: 20,
    lineWidth: 3,
  );
}
