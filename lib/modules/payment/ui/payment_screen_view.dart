import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/payment_screen_logic.dart';

class PaymentScreen extends GetView<PaymentScreenController> {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<PaymentScreenController>(PaymentScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) =>
          SafeArea(
            child: Scaffold(
              backgroundColor: Theme
                  .of(context)
                  .backgroundColor,
              body: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height90,
                        ),
                        Center(
                          child: Image(
                            image: AssetImage("assets/images/paymentimage.png"),
                            height: 130,
                            width: 200,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height25,
                        ),
                        Text(
                          'Horray!! Your order will be sent to the kitchen, After you have completed payment.',
                          style: TextStyle(
                              color: ColorConstants.primaryBigTextColor,
                              fontSize: Dimensions.TextSize20),
                        ),
                        SizedBox(
                          height: Dimensions.height50,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                            [
                              paymentType(image: "assets/images/paywithcard.png", flag: 0,text: 'Pay with Card'),
                              paymentType(image: "assets/images/paywithcash.png", flag: 1,text: 'Pay with Cash'),
                              paymentType(image: "assets/images/paycounter.png", flag: 2,text: 'Pay Counter'),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text('Total:  \$54.20',style: TextStyle(color: ColorConstants.bannerHeadingTextColor,fontSize: Dimensions.height30),),
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }

  paymentType({image, text, flag}) {
    return Obx(() {
      return InkWell(
        onTap: () { controller.controllerValue.value = flag; },
        child: Column(
          children: [
            Container(
                height: 220,
                width: 230,
                decoration: BoxDecoration(color: controller.controllerValue.value == flag ? ColorConstants.primaryButtonColor : ColorConstants.primaryButtonColor.withOpacity(0.25), borderRadius: BorderRadius.circular(10)),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Image(image: AssetImage(image.toString(),),height: 109,width: 126,color: controller.controllerValue.value != 4 ? controller.controllerValue.value == flag ? Colors.white : ColorConstants.primaryButtonColor.withOpacity(0.25) : ColorConstants.primaryButtonColor,),)
            ),
            SizedBox(height: Dimensions.height25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.controllerValue.value == flag ? Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorConstants.primaryButtonColor,

                  ),
                  child: Icon(
                    FeatherIcons.check,
                    color: Colors.white,
                    size: 25,
                  ),
                ): SizedBox(),
                SizedBox(width: Dimensions.SizedBoxValue10,),
                Text(text,style: TextStyle(fontSize: Dimensions.TextSize20,color:  controller.controllerValue.value == flag ? ColorConstants.primaryButtonColor: ColorConstants.primaryButtonColor.withOpacity(0.25)),)
              ],
            ),
            //Spacer(),
            //Text('Total:  \$54.20')

          ],
        ),
      );
    });
  }
}
