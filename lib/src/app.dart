import 'package:flutter/material.dart';
import 'package:mindcomposure/src/provider/ChatProvider.dart';
import 'package:mindcomposure/src/provider/DASS_provider.dart';
import 'package:mindcomposure/src/provider/FoodProvider.dart';
import 'package:mindcomposure/src/provider/HappyPicProvider.dart';
import 'package:mindcomposure/src/screens/CounsellorView/AdminHomepage.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/DeleteFoodPage.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/UpdateFoodPage.dart';
import 'package:mindcomposure/src/screens/DASSScreen/answer_test_screen.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/4-7-8Breathing/ListInstruction/Welcome4-7-8.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/AbdominalBreathing/ListInstructions/WelcomeAbdominal.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/AlternateNostril/ListInstructions/WelcomeAlternate.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/EqualBreathing/ListInstruction/WelcomeEqual.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/ProgressiveMuscular/ListInstructions/WelcomeMuscular.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/SkullShiningSkull/ListInstructions/WelcomeSkull.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/FoodModule/FoodFact.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/CatPoses/ListInstruction/WelcomeCat.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/ChildPoses/ListInstruction/WelcomeChild.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/CowPoses/ListInstruction/WelcomeCow.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/DolphinPoses/ListInstruction/WelcomeDolphin.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/ForwardFold/ListInstruction/WelcomeForwardFold.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/HeadtoKnee/ListInstruction/WelcomeHead.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/LegUp/ListInstruction/WelcomeLegUp.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/Savasana/ListInstruction/WelcomeSavasana.dart';
import 'package:provider/provider.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';
import 'package:mindcomposure/src/screens/DASSScreen/StressFirstScreen.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/ListBreathing.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/PhotoCollection/HappyPhoto.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/YogaList.dart';
import 'package:mindcomposure/src/screens/UserView/createProfile.dart';
import 'package:mindcomposure/src/screens/UserView/home.dart';
import 'package:mindcomposure/src/screens/UserView/introduction.dart';
import 'package:mindcomposure/src/screens/loginUser.dart';
import 'package:mindcomposure/src/screens/UserView/registerUser.dart';
import 'package:mindcomposure/src/screens/reset.dart';
import 'package:mindcomposure/src/screens/splashscreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<DASSProvider>(create: (_) => DASSProvider()),
          ChangeNotifierProvider<FoodProvider>(create: (_) => FoodProvider()),
          ChangeNotifierProvider<ChatProvider>(create: (_) => ChatProvider()),
          ChangeNotifierProvider<HappyPicProvider>(
              create: (_) => HappyPicProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                  .copyWith(secondary: Color.fromARGB(200, 255, 202, 130)),
            ),
            initialRoute: 'SplashScreen',
            routes: {
              'SplashScreen': (context) => SplashScreen(),
              'Login': (context) => LoginScreen(),
              'RegisterUser': (context) => RegisterUserScreen(),
              'Reset': (context) => ResetScreen(),
              'Intro': (context) => IntroductionScreen(),
              'CreateProfile': (context) => CreateProfileScreen(),
              'AdminHomepage': (context) => AdminHomePage(),
              'Home': (context) => HomeScreen(),
              'StressFirstScreen': (context) => StressFirstScreen(),
              'AnswerTest': (context) => AnswerTestScreen(),
              'ListBreathing': (context) => ListBreathing(),
              'WelcomeEqual': (context) => WelcomeEqual(),
              'WelcomeMuscular': (context) => WelcomeMuscular(),
              'WelcomeAlternate': (context) => WelcomeAlternate(),
              'WelcomeSkull': (context) => WelcomeSkull(),
              'WelcomeDigit': (context) => WelcomeDigit(),
              'WelcomeAbdominal': (context) => WelcomeAbdominal(),
              'YogaList': (context) => YogaList(),
              'WelcomeYogaDolphin': (context) => WelcomeDolphin(),
              'WelcomeYogaCat': (context) => WelcomeCat(),
              'WelcomeYogaCow': (context) => WelcomeCow(),
              'WelcomeYogaForward': (context) => WelcomeForward(),
              'WelcomeYogaChild': (context) => WelcomeChild(),
              'WelcomeYogaLegUp': (context) => WelcomeLegUp(),
              'WelcomeYogaHead': (context) => WelcomeHead(),
              'WelcomeYogaSavasana': (context) => WelcomeSavasana(),
              'FoodFact': (context) => FoodFactScreen(),
              'DeleteFoodPage': (context) => DeleteFoodPage(),
              'UpdateFoodPage': (context) => UpdateFoodPage(),
              'HappyPhoto': (context) => HappyPhoto(),
            }));
  }
}
