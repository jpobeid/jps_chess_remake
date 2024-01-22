import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<int>> positionPieces = [
      [0, 0],
      [1, 1],
      [1, 0],
    ];

    return SafeArea(
      child: Scaffold(
        body: makeBoard(
            size: MediaQuery.of(context).size.width,
            nSquares: 8,
            positionPieces: positionPieces),
      ),
    );
  }

  SizedBox makeBoard(
      {required double size,
      required int nSquares,
      required List<List<int>> positionPieces}) {
    assert(!positionPieces
        .any((element) => element.any((e) => e >= nSquares || e < 0)));
    return SizedBox(
      width: size,
      height: size,
      child: LayoutBuilder(
        builder: (context, constraint) {
          List<Positioned> squares = [];
          double ds = size / nSquares;
          for (int j = 0; j < nSquares; j++) {
            for (int i = 0; i < nSquares; i++) {
              squares.add(Positioned(
                bottom: j * ds,
                left: i * ds,
                height: ds,
                width: ds,
                child: Container(
                    color: (j + i).isEven ? Colors.green : Colors.white),
              ));
            }
          }
          List<Positioned> pieces = [];
          for (List<int> element in positionPieces) {
            pieces.add(Positioned(
              left: element[0] * ds,
              bottom: element[1] * ds,
              height: ds,
              width: ds,
              child: const Icon(Icons.ac_unit),
            ));
          }
          squares.addAll(pieces);
          return Stack(
            children: squares,
          );
        },
      ),
    );
  }
}
