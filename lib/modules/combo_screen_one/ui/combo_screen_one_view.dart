import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/combo_screen_one_logic.dart';

class ComboScreenViewOne extends GetView<ComboScreenController> {
  const ComboScreenViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ComboScreenController>(ComboScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              Image(
                image: AssetImage("assets/images/combo_one.png"),
                height: 180,
                width: double.infinity,
              ),
              SizedBox(
                height: 43,
              ),
              Text(
                'Choose your desire',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customDesire(imageName: Image(image: AssetImage("assets/images/small_type.png"),), type: 'small', flag: 0),
                    customDesire(imageName: Image(image: AssetImage("assets/images/medium_type.png"),), type: 'medium', flag: 1),
                    customDesire(imageName: Image(image: AssetImage("assets/images/large_type.png"),), type: 'large', flag: 2)


                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  children: [
                    CustomWidget.CustomPrimaryButton(title: 'Cancel Order',borderradius: 11.0,backgroundcolor: ColorConstants.bannerBackgroundColor,height: 60.0,width: 320.0),
                    Spacer(),
                    CustomWidget.CustomPrimaryButton(title: 'Add to cart',borderradius: 11.0,backgroundcolor: ColorConstants.bannerBackgroundColor,height: 60.0,width: 320.0),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  customDesire({imageName, type, flag}) {
    return GestureDetector(
      onTap: () {
        controller.itemIndex.value = flag;
        Get.to(ComboScreenViewTwo(itemtype: flag,));
      },
      child: Column(
        children: [
          Container(
              height: 167,
              width: 208,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: flag == controller.itemIndex
                    ? ColorConstants.selectedDesire
                    : ColorConstants.unselectedDesire,
              ),
              child: imageName),
          SizedBox(
            height: 15,
          ),
          Text(
            type,
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor, fontSize: 18),
          ),

        ],
      ),
    );
  }
}
