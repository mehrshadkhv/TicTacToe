import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        title: Text(
          'TicTacToe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            getScoreBoard(),
            SizedBox(height: 40),
            getGridView(),
            getTurn(),
          ],
        ),
      ),
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                    color: xOrOList[index] == 'X' ? Colors.red : Colors.green,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }

  void tapped(int index) {
    print('$index');
    setState(() {
      if (xOrOList[index] != '') {
        return;
      }
      if (isTurnO) {
        xOrOList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOrOList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }
      isTurnO = !isTurnO;
      checkWinner();
    });
  }

  void checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      print('Winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      print('Winner is ' + xOrOList[3]);
      return;
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      print('Winner is ' + xOrOList[6]);
      return;
    }
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      print('Winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      print('Winner is ' + xOrOList[1]);
      return;
    }
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      print('Winner is ' + xOrOList[2]);
      return;
    }
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      print('Winner is ' + xOrOList[0]);
      return;
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      print('Winner is ' + xOrOList[2]);
      return;
    }
    if (filledBoxes == 9) {
      print('game is equal');
    }
  }

  Widget getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void clearGame() {
    setState(() {});
  }
}
