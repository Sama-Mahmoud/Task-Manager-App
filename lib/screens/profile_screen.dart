import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_flutter_proj/screens/splash_screen.dart';
import '../constants/app_color.dart';
import '../constants/app_svg.dart';
import '../services/validator.dart';
import '../widgets/default_text_field.dart';
import '../widgets/dropdown_widget.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

final tasksProvider = StateProvider<List<String>>((_) {
  List<String> tasks = ["task 1", "task 2", "task 3", "task 4"];
  return tasks;
});



class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileUI();
  }
}
class _ProfileUI extends State<ProfileUI> {
  String dropdownValue = list.first;


  @override
  Widget build(BuildContext context,) {
    // TODO: implement build
    //List<Color> background =[app_color.]
    Size size = MediaQuery.sizeOf(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController sexController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    //TextEditingController taskController = TextEditingController();
    //GlobalKey<FormState> key = GlobalKey<FormState>();
// drop down menu button provider
    //String selectedtask = "";
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.only(left: 41, top: 39),
          child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(Icons.arrow_back)),
        ),
        //APPcolor
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 39),
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              //fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.38,
            ),
          ),
        ),
      ), //app bar elavation 0 , transparent
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          color: AppColor.backgroundcolor,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 133,
                      height: 133,
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: App_color.lightBlue),
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: AppColor.lightyellow,
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                          AppSvg.avatar,
                        )),
                      ),
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(-30, 52),
                      child: Container(
                          width: 33,
                          height: 33,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColor.backgroundcolor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: SvgPicture.asset(
                              AppSvg.addsquare,
                              width: 20,
                              height: 20,
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: 52,
              ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////
              DefaultTextField(
                  controller: nameController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(17),
                  ],
                  bottomPadding: 26,
                  label: "Fazil Laghari",
                  // hint: "Enter your full name",
                  icon: AppSvg.useradd,
                  sicon: AppSvg.edit,

                  //Tear-Off
                 // validator: Validator.validateName
              ),
              //3.4 layers
              // REGEX
              // read ,write, use
              //read, use,
              // use
              //no read,no use no write
              DefaultTextField(
                controller: ageController,
                label: "fazzzil72@gmail.com",
                icon: AppSvg.usertag,
                sicon: AppSvg.edit,
                bottomPadding: 26,

                // hint: "Enter your age",
                //type: TextInputType.number,
                //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //validator: Validator.validateage
              ),

              DefaultTextField(
                controller: phoneController,
                label: "Password",
                //hint: "Enter your phone number",
                //type: TextInputType.number,
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // validator: Validator.validatephone
                icon: AppSvg.lock,
                sicon: AppSvg.edit,
                bottomPadding: 26,
              ),
              ///////////////////////////////////////////////////////////////////
              DropdownButtonExample() ,


              DefaultTextField(
                controller: sexController,
                label: "Privacy",
                //hint: "Enter your phone number",
                //type: TextInputType.number,
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // validator: Validator.validatephone
                icon: AppSvg.securitycard,
                sicon: AppSvg.arrowdown2,
                bottomPadding: 26,
              ),
              DefaultTextField(
                controller: cityController,
                label: "Setting",
                icon: AppSvg.setting2,
                sicon: AppSvg.arrowdown2,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 46, bottom: 72),
                  child: ElevatedButton.icon(
                      label: Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xFF212832),
                          fontSize: 18,
                          //fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1.05,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SplashUI() ));


                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.lightyellow,
                          fixedSize: Size(size.width - 64, 54),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius
                                  .zero)), // set the background color
                      icon: SvgPicture.asset(AppSvg.logoutcurve)),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
