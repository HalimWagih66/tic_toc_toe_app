import 'dart:core';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/user_names.dart';
import '../../../widget/board_button.dart';
import '../../../widget/board_header.dart';
import '../../../widget/custom_awesome_dialog.dart';
import '../../input_information_users/view/input_information_users_view.dart';
import '../view_model/board_view_model.dart';

class BoardView extends StatefulWidget {
  static const routeName = "BoardView";
  final int counterButton;

  const BoardView({super.key, this.counterButton = 0});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  int scorePlayer_1 = 0;
  late BoardViewModel boardViewModel;
  int scorePlayer_2 = 0;
  @override
  void initState() {
    boardViewModel = BoardViewModel();
    for (int i = 0; i < 81; i++) {
      boardViewModel.selectedButtons.add(false);
    }
    super.initState();
  }
  bool enabledButton = true;
  final int timerFutureDelayed = 3;
  int counterForLoop = 0;

  @override
  Widget build(BuildContext context) {
    counterForLoop = 0;
    return Scaffold(
      backgroundColor: const Color(0xff011A2A),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(
                context, InputInformationUsersView.routeName);
            Provider
                .of<UserNames>(context, listen: false)
                .playerOneController
                .text = "";
            Provider
                .of<UserNames>(context, listen: false)
                .playerTwoController
                .text = "";
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff7f54c5),
          ),
        ),
        backgroundColor: const Color(0xff011A2A),
        title: const Text("X-O Game",
            style: TextStyle(
                fontFamily: 'XO2', fontSize: 34, color: Color(0xff7f54c5))),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: BoardHeader(
                  scorePlayer_1: scorePlayer_1, scorePlayer_2: scorePlayer_2)),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 33, left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, style: BorderStyle.solid),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.white10,
              ),
              child: Column(
                children: [
                  for (int i = 1; i <= widget.counterButton; i++)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (counterForLoop; counterForLoop <
                              widget.counterButton * i; counterForLoop++)
                            BoardButton(
                              enabledButton: boardViewModel.enabledButton,
                              selectedButton: boardViewModel
                                  .selectedButtons[counterForLoop],
                              fontSize: widget.counterButton == 3
                                  ? 81
                                  : widget.counterButton == 6
                                  ? 51
                                  : 26,
                              textButton: boardViewModel
                                  .boardState[counterForLoop],
                              onBtnClick: onUserClick,
                              position: counterForLoop,
                              colorText: const Color(0xfffc0e85),
                              counterButton: widget.counterButton,),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int itemCount = 0;
  Future<void> onUserClick(int position) async {
    if (boardViewModel.boardState[position].isNotEmpty) {
      return;
    }
    if (itemCount % 2 == 0) {
      boardViewModel.boardState[position] = "X";
      scorePlayer_1++;
      setState(() {});
    } else {
      boardViewModel.boardState[position] = "O";
      scorePlayer_2++;
      setState(() {});
    }
    itemCount++;
    if (boardViewModel.checkWinner("X", widget.counterButton)) {
      await executeWinnerPlayerX();
    } else if (boardViewModel.checkWinner("O", widget.counterButton)) {
      await executeWinnerPlayerO();
    } else if (itemCount == widget.counterButton * widget.counterButton) {
      await playerDrawExecution();
    }
    setState(() {});
  }

  Future<void> executeWinnerPlayerX() async {
    enabledButton = false;
    setState(() {});
    await Future.delayed(Duration(seconds: timerFutureDelayed), () {
      customAwesomeDialog(
        btnOkOnPress: () {
          enabledButton = true;
          boardViewModel.selectedButtons = List.filled(81, false);
          boardViewModel.boardState = [
            '', '', '',
            '', '', '',
            '', '', '',
          ];
          setState(() {});
        },
        context: context,
        desc:
        "You win, ${Provider
            .of<UserNames>(context, listen: false)
            .playerOneController
            .text}.",
      );
    });
    scorePlayer_1 += 5;
    itemCount = 0;
  }

  Future<void> executeWinnerPlayerO()async{
    enabledButton = false;
    setState(() {});
    await Future.delayed(Duration(seconds: timerFutureDelayed), () {
      customAwesomeDialog(
        context: context,
        btnOkOnPress: () {
          enabledButton = true;
          boardViewModel.selectedButtons = List.filled(81, false);
          boardViewModel.boardState = [
            '', '', '',
            '', '', '',
            '', '', '',
          ];
          setState(() {

          });
        },
        desc:
        "You win, ${Provider
            .of<UserNames>(context, listen: false)
            .playerTwoController
            .text}.",
      );
      itemCount = 0;
      scorePlayer_2 += 5;
    });
  }

  Future<void> playerDrawExecution()async{
    itemCount = 0;
    enabledButton = false;
    setState(() {});
    await Future.delayed(
      Duration(seconds: timerFutureDelayed),
          () {
        customAwesomeDialog(
          context: context,
          btnOkOnPress: () {
            enabledButton = true;
            boardViewModel.selectedButtons = List.filled(81, false);
            boardViewModel.boardState = [
              '', '', '',
              '', '', '',
              '', '', '',
            ];
            setState(() {});
          },
          desc: "Unfortunately no one won",
          dialogType: DialogType.warning,
          btnCancelOnPress: () {
            Navigator.pushReplacementNamed(
                context, InputInformationUsersView.routeName);
            Provider
                .of<UserNames>(context, listen: false)
                .playerOneController
                .text = "";
            Provider
                .of<UserNames>(context, listen: false)
                .playerTwoController
                .text = "";
          },
        );
      },
    );
  }

}
