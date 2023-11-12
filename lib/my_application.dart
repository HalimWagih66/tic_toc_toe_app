import 'package:flutter/material.dart';
import 'package:tic_tac_toe_xo/provider/user_names.dart';
import 'package:tic_tac_toe_xo/features/board_screen/view/board_view.dart';
import 'package:tic_tac_toe_xo/features/input_information_users/view/input_information_users_view.dart';
import 'package:provider/provider.dart';

import 'features/choose_board/view/choose_board_view.dart';
import 'features/splash screen/view/splash_screen.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => UserNames(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          BoardView.routeName:(context)=> const BoardView(),
          SplashScreen.routeName:(context)=>const SplashScreen(),
          ChooseBoardView.routeName:(context)=>const ChooseBoardView(),
          InputInformationUsersView.routeName:(context)=>const InputInformationUsersView(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
