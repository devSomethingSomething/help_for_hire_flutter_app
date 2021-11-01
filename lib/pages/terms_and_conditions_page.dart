import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatefulWidget {
  TermsAndConditionsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  bool isClicked = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              // ignore: prefer_const_constructors
              Text("THESE TERMS OF USE WERE UPDATED IN OCTOBER 2021  " +
                  "\n \nTHESE TERMS OF USE APPLY TO THE USE OF THE (HELP FOR HIRE) MOBILE APPLICATION. " +
                  "AND THE (HELP FOR HIRE) SERVICES. PLEASE READ THESE TERMS OF USE CAREFULLY. BY USING THE (HELP FOR HIRE) MOBILE APPLICATION " +
                  "YOU INDICATE YOUR UNDERSTANDING AND ACCEPTANCE OF THESE TERMS OF USE. IF YOU DO NOT AGREE TO THESE TERMS OF USE, YOU MUST NOT USE THE (HELP FOR HIRE) MOBILE APPLICATION.\n \n" +
                  "PRIVACY POLICY\n\n" +
                  "THE PRIVACY POLICY IS A PART OF THESE TERMS. BY ACCEPTING THESE TERMS, YOU ACKNOWLEDGE THAT YOU HAVE READ AND UNDERSTAND THEM. IF YOU DO NOT COMPLY WITH ANY OF THE PRIVACY POLICY, THAT WILL BE A BREACH OF THE TERMS." +
                  "UNDER THE PRIVACY POLICY AND THE TERMS, (HELP FOR HIRE) MAY HAVE CLAIMS AND OTHER RIGHTS AGAINST YOU." +
                  "THIS (HELP FOR HIRE) PRIVACY POLICY APPLIES TO HOW WE COLLECT, USE AND PROCESS YOUR PERSONAL INFORMATION WHEN YOU USE THE (HELP FOR HIRE) MOBILE APPLICATION OR THE SERVICES PROVIDED BY (HELP FOR HIRE). PLEASE READ THIS PRIVACY POLICY CAREFULLY." +
                  "THIS PRIVACY POLICY FORMS PART OF THE (HELP FOR HIRE) TERMS OF USE. BY ACCESSING OR USING THE (HELP FOR HIRE) MOBILE APPLICATION OR THE SERVICES PROVIDED BY (HELP FOR HIRE) YOU ARE AGREEING TO THIS PRIVACY POLICY AND THE TERMS OF USE. IF YOU DO NOT COMPLY WITH THE PRIVACY POLICY, THAT WILL ALSO BE A BREACH OF THE TERMS OF USE. (HELP FOR HIRE) AND OTHERS WILL HAVE CLAIMS AND OTHER RIGHTS AGAINST YOU UNDER THE PRIVACY POLICY AND THE TERMS OF USE." +
                  "THIS PRIVACY POLICY FORMS PART OF THE (HELP FOR HIRE) TERMS OF USE. BY ACCESSING OR USING THE (HELP FOR HIRE) MOBILE APPLICATION OR THE SERVICES PROVIDED BY (HELP FOR HIRE) YOU ARE AGREEING TO THIS PRIVACY POLICY AND THE TERMS OF USE. IF YOU DO NOT COMPLY WITH THE PRIVACY POLICY, THAT WILL ALSO BE A BREACH OF THE TERMS OF USE. (HELP FOR HIRE) AND OTHERS WILL HAVE CLAIMS AND OTHER RIGHTS AGAINST YOU UNDER THE PRIVACY POLICY AND THE TERMS OF USE.\n\n" +
                  "IF THIS PRIVACY POLICY IS GOVERNED BY THE CONSUMER PROTECTION ACT, 68 OF 2008 (\"CPA\"), THE ELECTRONIC COMMUNICATIONS AND TRANSACTIONS ACT, 25 OF 2002 (\"ECTA\"), OR THE PROTECTION OF PERSONAL INFORMATION ACT, 4 OF 2013, (\"POPI\"), NO PROVISION OF THIS PRIVACY POLICY IS INTENDED TO BE IN CONFLICT WITH ANY PROVISION OF THE CPA, ECTA, OR POPI. AS A RESULT, ALL SECTIONS OF THIS PRIVACY POLICY MUST BE INTERPRETED WITH CAUTION, TO THE EXTENT NECESSARY, " +
                  "TO ENSURE THAT THE CPA, ECTA, AND POPI ARE FOLLOWED. "),
              // ignore: prefer_const_constructors
              SizedBox(width: 14, height: 14),
              Text(
                "BY CHECKING THIS BOX YOU AGREE TO THE ABOVE TERMS AND CONDITIONS" +
                    "\n\n ",
                style: TextStyle(fontSize: 14),
              ),
              Container(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                      value: this.isClicked,
                      onChanged: (value) {
                        setState(() {
                          isClicked = !isClicked;
                        });
                        if (isClicked == true) {
                          print("true");
                        } else {
                          print("false");
                        }
                      },
                    ),
                    Text("I ACCEPT THE TERMS AND CONDITIONS")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
