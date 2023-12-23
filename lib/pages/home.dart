import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/Color.dart';
import 'package:untitled1/pages/Gamelogic.dart';
import 'package:untitled1/pages/NavBar.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();

}


class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0; // to check the draw
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  Game game = Game();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    if (kDebugMode) {
      print(game.board);
    }
  }

  @override
  Widget build(BuildContext context) {

    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.lightGreen,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');

          },
          child: const Icon(Icons.exit_to_app_sharp),
        ),
        backgroundColor: MainColor.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "It's $lastValue turn".toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 58,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            SizedBox(

              width: boardWidth,
              height: boardWidth,

              child: GridView.count(
                crossAxisCount: Game.boardlenth ~/ 3,
                padding: const EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(Game.boardlenth, (index) {

                  return InkWell(

                    onTap: gameOver

                        ? null
                        : () {
                      if (game.board![index] == "") {
                        setState(() {
                          game.board![index] = lastValue;
                          turn++;
                          gameOver = game.winnerCheck(
                              lastValue, index, scoreboard, 3);

                          if (gameOver) {
                            result = "$lastValue is the Winner";
                          } else if (!gameOver && turn == 9) {
                            result = "It's a Draw!";
                            gameOver = true;
                          }
                          if (lastValue == "X") {
                            lastValue = "O";
                          } else {
                            lastValue = "X";
                          }
                        });
                      }
                    },
                    child: Container(



                      width: Game.blocSize,
                      height: Game.blocSize,
                      decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 54.0),textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  //erase the board
                  game.board = Game.initGameBoard();
                  lastValue = "X";
                  gameOver = false;
                  turn = 0;
                  result = "";
                  scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text("Repeat the Game"),
            ),
          ],
        ));
  }
}
