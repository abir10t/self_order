import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/ItemPage/ui/user_choice_dialog.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/item_screen_logic.dart';

class ItemPageScreen extends GetView<ItemScreenController> {
  String id;
  ItemPageScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ItemScreenController>(ItemScreenController());
    controller.getFoods(id);
    controller.getSubCategory(id);
    final orientation = MediaQuery.of(Get.context!).orientation;
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/images/itempag.png"),
                      height: 298,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: Dimensions.SizedBoxValue20,
                      right: Dimensions.SizedBoxValue15,
                      child: CustomWidget.CustomButtonInImage(
                          text: 'Eat in', onTap: () {}),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'Burger',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.primaryBigTextColor),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: Row(
                      children: [
                        /// ToDo: Do here///
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: controller.subCategories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 40.h),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/smallburger.png'),
                                        height: 70,
                                        width: 76,
                                      ),
                                    ),
                                    Text(
                                        '${controller.subCategories[index]['subcategory_name']}'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(children: [
                            /// ToDo: work here///
                            // GridView.count(
                            //   shrinkWrap: true,
                            //   crossAxisCount: 5,
                            //   crossAxisSpacing: 10,
                            //   mainAxisSpacing: 10,
                            //   childAspectRatio: 2,
                            //   children: List.generate(7, (index) {
                            //     return foodVarision(text: 'Club Beef');
                            //   }),
                            // ),
                            Wrap(
                              spacing: 20.w,
                              runSpacing: 12.h,
                              alignment: WrapAlignment.center,
                              children: [
                                for (int i = 0; i <= 5; i++)
                                  foodVarision(text: 'Culf Beef'),
                              ],
                            ),

                            Flexible(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: Dimensions.SizedBoxValue30,
                                    ),
                                    GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.foods.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 20,
                                                // crossAxisSpacing: 20,
                                                crossAxisCount: (orientation ==
                                                        Orientation.portrait)
                                                    ? 3
                                                    : 4),
                                        physics: ScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              uerChoiceDialog(
                                                  context: context,
                                                  id:
                                                      '${controller.foods[index]['id']}',
                                                  heading:
                                                      '${controller.foods[index]['name']}',
                                                  subHeading:
                                                      '${controller.foods[index]['product_description']}',
                                                  price:
                                                      '\$${controller.foods[index]['product_price']}');
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image(
                                                  width: 208.w,
                                                  height: 90.h,
                                                  image: AssetImage(
                                                      "assets/images/item.png"),
                                                ),
                                                SizedBox(
                                                  height: Dimensions
                                                      .SizedBoxValue20,
                                                ),
                                                Text(
                                                  '${controller.foods[index]['name']}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Dimensions.TextSize20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${controller.foods[index]['product_description']}',
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .primaryBigTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .TextSize15),
                                                ),
                                                // SizedBox(
                                                //   height: Dimensions
                                                //       .SizedBoxValue25,
                                                // ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '\$${controller.foods[index]['product_price']}',
                                                      style: TextStyle(
                                                          color: ColorConstants
                                                              .primaryBigTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: Dimensions
                                                              .TextSize18),
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Icon(
                                                          FeatherIcons.plus),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            )

                            // CustomWidget.CustomItemwithPrice(Tap:userChoice(context: context) ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget foodVarision({required String text}) {
    return Container(
      height: 30,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color: ColorConstants.borderColor.withOpacity(0.2), width: 3),
      ),
      child: Center(child: Text(text)),
    );
  }

  // userChoice({required BuildContext context}) {
  //   WidgetsBinding.instance?.addPostFrameCallback((_){
  //     showDialog(
  //       context: context,
  //       builder: (context) => Dialog(
  //         child: Container(
  //           child: Text('hello'),
  //         ),
  //       ),
  //     );
  //   });
  //
  // }

}
