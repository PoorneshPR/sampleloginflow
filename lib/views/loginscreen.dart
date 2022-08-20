import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleauthroll/common/constants.dart';
import 'package:sampleauthroll/common/fontstyle.dart';
import 'package:sampleauthroll/common/widgets/commonbutton.dart';
import 'package:sampleauthroll/common/widgets/commontextformfield.dart';
import 'package:sampleauthroll/common/widgets/reusablewidgets.dart';
import '../utils/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableWidgets.emptyBox(height: 80),
            Center(
              child: Text(Constants.login, style: FontStyle.black22Bold800),
            ),
            ReusableWidgets.emptyBox(height: 50),
            Text(Constants.email, style: FontStyle.black13Medium400),
            CommonTextFormField(
              hintText: Constants.enterEmail,
              prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 15, bottom: 5),
                  child: Icon(
                    Icons.email,
                    color: HexColor("828282"),
                    size: 16,
                  )),
              contentPadding: EdgeInsets.only(bottom: 0),
            ),
            ReusableWidgets.emptyBox(height: 20),
            Text(Constants.password, style: FontStyle.black13Medium400),
            CommonTextFormField(
              hintText: Constants.enterPassword,
              prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 15,),
                  child: Icon(
                    Icons.lock,
                    color: HexColor("828282"),
                    size: 16,
                  )), isObscure: true,

              suffixIcon: IconButton(icon: Icon(CupertinoIcons.eye,
                color: HexColor("828282"),
                size: 16,
              ), onPressed: () {},),
            ),
            ReusableWidgets.emptyBox(height: 40),
            Center(
              child: CommonButton(width: 150,buttonText: Constants.signIn, buttonStyle: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular( 25),
                    )),backgroundColor:MaterialStateProperty.all<Color>(HexColor("#3ba1fe")) ,
                elevation: MaterialStateProperty.all<double>(0),
              ), fontStyle: FontStyle.white17Medium,),
            ),
            ReusableWidgets.emptyBox(height: 20),
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: (){}, child: Text(Constants.forgotPassword)),
            )),
            ReusableWidgets.emptyBox(height: 40),
            Row(
              children: [
                Text(Constants.doNotHaveAccount,style: FontStyle.black17Medium,),
                InkWell(onTap: (){


                },child: Text(Constants.doNotHaveAccount,style: FontStyle.black17Medium,)),
              ],
            )



          ],
        ),
      ),
    );
  }
}
