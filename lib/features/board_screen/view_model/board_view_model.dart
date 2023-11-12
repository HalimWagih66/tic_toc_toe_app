

import 'package:flutter/material.dart';

class BoardViewModel extends ChangeNotifier{
  bool enabledButton = true;
  final int timerFutureDelayed = 3;
  int scorePlayer_2 = 0;
  List<bool> selectedButtons = [];
  int counterForLoop = 0;
  int scorePlayer_1 = 0;
  int itemCount = 0;
  List<String>  boardState = [
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '',
  ];
  // void onUserClick(int position,BuildContext context,int counterButton)  {
  //   if (boardState[position].isNotEmpty) return;
  //   checkThePlayer(position);
  //   if (checkWinner("X",counterButton)) {
  //     executePlayerX(context);
  //   } else if (checkWinner("O",counterButton)) {
  //     executePlayerO(context);
  //   } else if (itemCount == counterButton * counterButton) {
  //     playerDrawExecution(context);
  //   }
  //   notifyListeners();
  // }
  //
  //
  void checkThePlayer(int position){
    if (itemCount % 2 == 0) {
      boardState[position] = "X";
      scorePlayer_1++;
      notifyListeners();
    } else {
      boardState[position] = "O";
      scorePlayer_2++;
      notifyListeners();
    }
    itemCount++;
  }
  //
  //
  //
  // void executePlayerX(BuildContext context)async{
  //   enabledButton = false;
  //   notifyListeners();
  //   await Future.delayed(Duration(seconds: timerFutureDelayed), () {
  //     customAwesomeDialog(
  //       btnOkOnPress: (){
  //         enabledButton = true;
  //         selectedButtons = List.filled(81, false);
  //         boardState = [
  //           '', '', '',
  //           '', '', '',
  //           '', '', '',
  //         ];
  //         notifyListeners();
  //       },
  //       context: context,
  //       desc:
  //       "You win, ${Provider.of<UserNames>(context, listen: false).playerOneController.text}.",
  //     );
  //   });
  //   scorePlayer_1 += 5;
  //   itemCount = 0;
  // }
  //
  //
  // void executePlayerO(BuildContext context)async{
  //   enabledButton = false;
  //   notifyListeners();
  //   await Future.delayed(Duration(seconds: timerFutureDelayed), () {
  //     customAwesomeDialog(
  //       context: context,
  //       btnOkOnPress: (){
  //         enabledButton = true;
  //         selectedButtons = List.filled(81, false);
  //         boardState = [
  //           '', '', '',
  //           '', '', '',
  //           '', '', '',
  //         ];
  //         notifyListeners();
  //       },
  //       desc:
  //       "You win, ${Provider.of<UserNames>(context, listen: false).playerTwoController.text}.",
  //     );
  //     itemCount = 0;
  //     scorePlayer_2 += 5;
  //   });
  // }
  //
  //
  // void playerDrawExecution(BuildContext context)async{
  //   itemCount = 0;
  //   enabledButton = false;
  //   notifyListeners();
  //   await Future.delayed(
  //     Duration(seconds: timerFutureDelayed),
  //         () {
  //       customAwesomeDialog(
  //         context: context,
  //         btnOkOnPress: (){
  //           enabledButton = true;
  //           selectedButtons = List.filled(81, false);
  //           boardState = [
  //             '', '', '',
  //             '', '', '',
  //             '', '', '',
  //           ];
  //           notifyListeners();
  //         },
  //         desc: "Unfortunately no one won",
  //         dialogType: DialogType.warning,
  //         btnCancelOnPress: () {
  //           Navigator.pushReplacementNamed(context,InputInformationUsersView.routeName);
  //           Provider.of<UserNames>(context,listen: false).playerOneController.text = "";
  //           Provider.of<UserNames>(context,listen: false).playerTwoController.text = "";
  //         },
  //       );
  //     },
  //   );
  // }


  bool validateBoard3X3(String playerSymbol){
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i + 0] == playerSymbol &&
          boardState[i + 1] == playerSymbol &&
          boardState[i + 2] == playerSymbol) {
        selectedButtons[i+0] = true;
        selectedButtons[i+1] = true;
        selectedButtons[i+2] = true;
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i + 0] == playerSymbol &&
          boardState[i + 3] == playerSymbol &&
          boardState[i + 6] == playerSymbol) {
        selectedButtons[i+0] = true;
        selectedButtons[i+3] = true;
        selectedButtons[i+6] = true;

        return true;
      }
    }
    if (boardState[0] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[8] == playerSymbol) {
      selectedButtons[0] = true;
      selectedButtons[4] = true;
      selectedButtons[8] = true;
      return true;
    }
    if (boardState[2] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[6] == playerSymbol) {
      selectedButtons[2] = true;
      selectedButtons[4] = true;
      selectedButtons[6] = true;
      return true;
    }
    return false;
  }


  bool validateBoard6X6(String playerSymbol){
     for (int i = 0; i < 36; i += 6) {
      if (boardState[i + 0] == playerSymbol &&
          boardState[i + 1] == playerSymbol &&
          boardState[i + 2] == playerSymbol &&
          boardState[i + 3] == playerSymbol &&
          boardState[i + 4] == playerSymbol &&
          boardState[i + 5] == playerSymbol) {
        selectedButtons[i + 0] = true;
            selectedButtons[i + 1] = true;
            selectedButtons[i + 2] = true;
            selectedButtons[i + 3] = true;
            selectedButtons[i + 4] = true;
            selectedButtons[i + 5] = true;
        return true;
      }
    }
    for (int i = 0; i < 6; i++) {
      if (boardState[i + 0] == playerSymbol &&
          boardState[i + 6] == playerSymbol &&
          boardState[i + 12] == playerSymbol &&
          boardState[i + 18] == playerSymbol &&
          boardState[i + 24] == playerSymbol &&
          boardState[i + 32] == playerSymbol) {
        selectedButtons[i + 0] = true;
            selectedButtons[i + 6] = true;
            selectedButtons[i + 12] = true;
            selectedButtons[i + 18] = true;
            selectedButtons[i + 24] = true;
            selectedButtons[i + 32] = true;
        return true;
      }
    }
    if (boardState[0] == playerSymbol &&
        boardState[7] == playerSymbol &&
        boardState[14] == playerSymbol &&
        boardState[21] == playerSymbol &&
        boardState[28] == playerSymbol &&
        boardState[35] == playerSymbol) {
      selectedButtons[0] = true;
          selectedButtons[7] = true;
          selectedButtons[14] = true;
          selectedButtons[21] = true;
          selectedButtons[28] = true;
          selectedButtons[35] = true;
      return true;
    }
    if (boardState[5] == playerSymbol &&
        boardState[10] == playerSymbol &&
        boardState[15] == playerSymbol &&
        boardState[20] == playerSymbol &&
        boardState[25] == playerSymbol &&
        boardState[30] == playerSymbol) {
      selectedButtons[5] = true;
          selectedButtons[10] = true;
          selectedButtons[15] = true;
          selectedButtons[20] = true;
          selectedButtons[25] = true;
          selectedButtons[30] = true;
      return true;
    }
    return false;
  }


  bool validateBoard9X9(String playerSymbol){
     for (int i = 0; i < 81; i += 9) {
      if (boardState[i + 0] == playerSymbol &&
          boardState[i + 1] == playerSymbol &&
          boardState[i + 2] == playerSymbol &&
          boardState[i + 3] == playerSymbol &&
          boardState[i + 4] == playerSymbol &&
          boardState[i + 5] == playerSymbol &&
          boardState[i + 6] == playerSymbol &&
          boardState[i + 7] == playerSymbol &&
          boardState[i + 8] == playerSymbol) {
        selectedButtons[i + 0] = true;
            selectedButtons[i + 1] = true;
            selectedButtons[i + 2] = true;
            selectedButtons[i + 3] = true;
            selectedButtons[i + 4] = true;
            selectedButtons[i + 5] = true;
            selectedButtons[i + 6] = true;
            selectedButtons[i + 7] = true;
            selectedButtons[i + 8] = true;
        return true;
      }
    }
    for (int i = 0; i < 9; i++) {
      if (boardState[i + 0] == playerSymbol &&
          boardState[i + 9] == playerSymbol &&
          boardState[i + 18] == playerSymbol &&
          boardState[i + 27] == playerSymbol &&
          boardState[i + 36] == playerSymbol &&
          boardState[i + 45] == playerSymbol &&
          boardState[i + 54] == playerSymbol &&
          boardState[i + 63] == playerSymbol &&
          boardState[i + 72] == playerSymbol) {
        selectedButtons[i + 0] = true;
            selectedButtons[i + 9] = true;
            selectedButtons[i + 18] = true;
            selectedButtons[i + 27] = true;
            selectedButtons[i + 36] = true;
            selectedButtons[i + 45] = true;
            selectedButtons[i + 54] = true;
            selectedButtons[i + 63] = true;
            selectedButtons[i + 72] = true;
        return true;
      }
    }
    if (boardState[0] == playerSymbol &&
        boardState[10] == playerSymbol &&
        boardState[20] == playerSymbol &&
        boardState[30] == playerSymbol &&
        boardState[40] == playerSymbol &&
        boardState[50] == playerSymbol &&
        boardState[60] == playerSymbol &&
        boardState[70] == playerSymbol &&
        boardState[80] == playerSymbol) {
      selectedButtons[0] = true;
          selectedButtons[10] = true;
          selectedButtons[20] = true;
          selectedButtons[30] = true;
          selectedButtons[40] = true;
          selectedButtons[50] = true;
          selectedButtons[60] = true;
          selectedButtons[70] = true;
          selectedButtons[80] = true;
      return true;
    }
    if (boardState[8] == playerSymbol &&
        boardState[16] == playerSymbol &&
        boardState[24] == playerSymbol &&
        boardState[32] == playerSymbol &&
        boardState[40] == playerSymbol &&
        boardState[48] == playerSymbol &&
        boardState[56] == playerSymbol &&
        boardState[64] == playerSymbol &&
        boardState[72] == playerSymbol) {
      selectedButtons[8] = true;
          selectedButtons[16] = true;
          selectedButtons[24] = true;
          selectedButtons[32] = true;
          selectedButtons[40] = true;
          selectedButtons[48] = true;
          selectedButtons[56] = true;
          selectedButtons[64] = true;
          selectedButtons[72] = true;
      return true;
    }
    return false;
  }


  bool checkWinner(String playerSymbol,int counterButton) {
    if (counterButton == 3) {
      return validateBoard3X3(playerSymbol);
    } else if (counterButton == 6) {
        return validateBoard6X6(playerSymbol);
    } else {
      return validateBoard9X9(playerSymbol);
    }
  }
}

