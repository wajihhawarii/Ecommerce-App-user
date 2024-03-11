import "package:ecommerceappn/Responsive/respons.dart";
import "package:ecommerceappn/core/constant/color.dart";
import "package:flutter/material.dart";
import "package:get/get_state_manager/get_state_manager.dart";
import "../../core/localization/changelocal.dart";
import "../../data/datasourse/static/languagetypelist.dart";
import "../widgets/language/customappbar.dart";
import "../widgets/language/custombuttonlangauge.dart";

class LanguagePage extends GetView<LanguageControllerImp> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            ...List.generate(languagelist.length, (index) {
              return Column(
                children: [
                  CustomButtonLangauge(
                    langname: languagelist[index].langname,
                    langimage: languagelist[index].langimage,
                    onTap: () {
                      if (index == 0) {
                        controller.changeLang("ar");
                        controller.goToOnBording();
                      } else if (index == 1) {
                        controller.changeLang("en");
                        controller.goToOnBording();
                      } else if (index == 2) {
                        controller.changeLang("de");
                        controller.goToOnBording();
                      } else {
                        controller.changeLang("tr");
                        controller.goToOnBording();
                      }
                    },
                  ),
                  SizedBox(
                    width: Responseive.screenWidth * 0.8,
                    child: const Divider(
                      color: AppColor.black,
                      thickness: 1,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
