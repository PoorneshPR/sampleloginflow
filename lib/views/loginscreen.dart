import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleauthroll/common/fontstyle.dart';
import 'package:sampleauthroll/common/widgets/commontextformfield.dart';
import 'package:sampleauthroll/utils/colorpalette.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mobileNumController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId="";
  bool otpScreenHere =false;
  bool showLoading = false;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(color: Colors.white,
        child: Column(
          children: [
            Container(color: Colors.green,
              height: 200,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "LoginScreen",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 25)),

                  ],
                ),
              ),

            ),
            Stack(
              children: [
                Container(color: Colors.green, height: 30),
                SingleChildScrollView(
                  child: showLoading?const Center(child: CircularProgressIndicator(),):Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("MobileNumber",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 10,
                        ),

                        CommonTextFormField(hintText: "Mobile Number",
                            controller: mobileNumController,keyboardType: TextInputType.phone,inputType: TextInputType.phone),
                        const SizedBox(
                          height: 10,
                        ),
                       Text(otpScreenHere?"OTP Screen will display Here":"OTP",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(visible: otpScreenHere,
                          child: CommonTextFormField(
                              hintText: "OTP", controller: otpController),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showLoading=true;
                                });
                                otpScreenHere?signInOtp(): verificationNumber();
                              },
                              child: Text(
                                  otpScreenHere?"verify":"Send", style: FontStyle.black15Medium),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                      Color>(
                                      HexColor("90917E")))),
                        )
                        // ElevatedButton(onPressed: (), child: child)
                      ],
                    ),
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
  void signInOtp(){
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);

  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if(authCredential.user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });


          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
  void verificationNumber() async{
    debugPrint('number ${mobileNumController.text.trim()}');


    auth.verifyPhoneNumber(phoneNumber: '+91 ${mobileNumController.text}',
        verificationCompleted: ( phoneAuthCredentials) async {

          setState(() {
            showLoading=true;
          });
          signInWithPhoneAuthCredential(phoneAuthCredentials);
        },
        verificationFailed: (FirebaseAuthException exception,) {
          setState(() {
            showLoading=true;
          });
      print(exception.message);

        },
        codeSent: (String verificationID, int? resendToken) {

      setState(() {
        print("verificationIddddd");
        print(verificationID);
        verificationId=verificationID;
        otpScreenHere=true;
        showLoading=false;
      });

        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationId=verificationID;
        });
  }
}
