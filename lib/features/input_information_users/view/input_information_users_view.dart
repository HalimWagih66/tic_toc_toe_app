import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../choose_board/view/choose_board_view.dart';
import '../../../provider/user_names.dart';
import '../../../widget/custom_form_field.dart';

class InputInformationUsersView extends StatelessWidget {
  static const routeName = "InputInformationUsers";

  const InputInformationUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff1a1d50)
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Enter Player Names",style: TextStyle(color: Colors.white,fontFamily: "XO2",fontSize: 30),),
              const SizedBox(height: 33),
              CustomFormField(
                textInputAction: TextInputAction.next,
                prefixText: "X",
                  textEditingController: Provider.of<UserNames>(context,listen: false).playerOneController,
                  labelText: "Player One", prefixTextColor: const Color(0xffe41c58),),
              const SizedBox(height: 33),
              CustomFormField(
                textInputAction: TextInputAction.done,
                prefixText: "O",
                  prefixTextColor: const Color(0xfffcd034),
                  textEditingController: Provider.of<UserNames>(context,listen: false).playerTwoController,
                  labelText: "Player Two",
              ),
              const SizedBox(height: 33),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical:15),
                      backgroundColor: const Color(0xD50099cb),
                      elevation: 10
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ChooseBoardView.routeName);
                      if (Provider.of<UserNames>(context,listen: false).playerOneController.text.isEmpty) {
                        Provider.of<UserNames>(context,listen: false).playerOneController.text = "player 1";
                      }
                      if (Provider.of<UserNames>(context,listen: false).playerTwoController.text.isEmpty) {
                        Provider.of<UserNames>(context,listen: false).playerTwoController.text = "player 2";
                      }
                    },
                    child: const Text(
                      "START GAME",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
