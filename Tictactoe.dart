//Ali Shojaei is Write this Code
import 'dart:io';
import 'dart:core';

bool winner = false;
bool isXturn = true;
int moveCount = 0;

List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combination = [
  '012',
  '036',
  '048',
  '147',
  '258',
  '345',
  '678',
  '246'
];
//==============================================================================
void main() {
  generateBoard();
  getnextCharacter();
}

//==============================================================================
//Check combination is true or false for player (X or O)
bool checkCombination(String combination, String checkFor) {
  List<int> numbers = combination.split('').map((item) {
    return int.parse(item);
  }).toList();
  bool match = false;
  for (final item in numbers) {
    if (values[item] == checkFor) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}

//==============================================================================
void checkWinner(player) {
  for (final item in combination) {
    bool combinationValidity = checkCombination(item, player);
    if (combinationValidity == true) {
      print('$player Won!');
      winner == true;
      break;
    }
  }
}

//==============================================================================
//get input. chech winners
void getnextCharacter() {
  //get input from player
  print('Choose Number for ${isXturn == true ? "X" : "O"}');
  int number = int.parse(stdin.readLineSync()!);
  //change the value of selected number in values
  values[number - 1] = isXturn ? "X" : "O";
  //change player turn.
  isXturn = !isXturn;
  //increment move count
  moveCount++;
  if (moveCount == 9) {
    winner == true;
    print('Draw!');
  } else {
    //clear the console
    clearScreen();
    //redraw the board.
    generateBoard();
  }
  //check validity for players.
  //
  //check validity for X player.
  checkWinner("X");
  //check validity for O player.
  checkWinner("O");
  //until we have a winner, we call current function.
  if (winner == false) getnextCharacter();
}

//==============================================================================
//clear console screen
void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

//==============================================================================
void generateBoard() {
  print('   |   |   ');
  print(' ${values[0]} | ${values[1]} | ${values[2]} ');
  print('___|___|___');
  print('   |   |   ');
  print(' ${values[3]} | ${values[4]} | ${values[5]} ');
  print('___|___|___');
  print('   |   |   ');
  print(' ${values[6]} | ${values[7]} | ${values[8]} ');
  print('   |   |   ');
}
