import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/combo_screen_one/ui/combo_screen_one_view.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';
import '../model/ProductModel.dart';
import 'item_customise_page.dart';
import 'item_customise_page.dart';

userChoiceDialog({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        ItemScreenController controller = Get.find();

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Obx(
            () => Container(
              width: 656.w,
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: Dimensions.SizedBoxValue30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          children: [
                            Text(
                              'Make your choice',
                              style: TextStyle(
                                  color: ColorConstants.primaryButtonColor,
                                  fontSize: 30.sp),
                            ),
                            Spacer(),
                            CustomWidget.CustomCloseSection(context: context),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: controller.product.value.baseUrl! +
                                  controller.product.value.productImage!,
                              height: 158.h,
                              width: 212.w,
                            ),
                            SizedBox(width: 30.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${controller.product.value.name}',
                                  style: TextStyle(
                                      color: ColorConstants.primaryBigTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '${controller.product.value.productDescription}',
                                  style: TextStyle(
                                      color: ColorConstants.primaryBigTextColor
                                          .withOpacity(0.5),
                                      fontSize: 30.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${controller.product.value.productPrice}',
                                      style: TextStyle(
                                          color: ColorConstants
                                              .bannerHeadingTextColor
                                              .withOpacity(0.5),
                                          fontSize: 30.sp),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      'X ${controller.product.value.productPrice}',
                                      style: TextStyle(
                                          color: ColorConstants
                                              .bannerHeadingTextColor
                                              .withOpacity(0.5),
                                          fontSize: 30.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomWidget.ItemCountSection(),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          (controller.product.value.chrust.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chrust',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.chrust.length,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 1,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 1),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return RadioListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  value: i,
                                                  activeColor: ColorConstants
                                                      .primaryColor,
                                                  selected: (controller
                                                              .product
                                                              .value
                                                              .selectedChrustId ==
                                                          i)
                                                      ? true
                                                      : false,
                                                  title: Text(
                                                      '${controller.product.value.chrust[i].name}',
                                                      style: TextStyle(
                                                        fontSize: 16.h,
                                                      )),
                                                  groupValue: controller.product
                                                      .value.selectedChrustId,
                                                  onChanged: (v) {
                                                    setState(() {
                                                      controller.product.value
                                                          .selectedChrustId = i;
                                                    });
                                                  });
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.toppings.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Toppings',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.toppings.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          ColorConstants
                                                              .primaryColor,
                                                      value: controller
                                                          .product
                                                          .value
                                                          .toppings[i]
                                                          .selected,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          controller
                                                                  .product
                                                                  .value
                                                                  .toppings[i]
                                                                  .selected =
                                                              !controller
                                                                  .product
                                                                  .value
                                                                  .toppings[i]
                                                                  .selected;
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      '${controller.product.value.toppings[i].name}',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.style.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Style',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount:
                                              controller.menu['style'].length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return RadioListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  value: i,
                                                  activeColor: ColorConstants
                                                      .primaryColor,
                                                  selected: (controller
                                                              .product
                                                              .value
                                                              .selectedStyleId ==
                                                          i)
                                                      ? true
                                                      : false,
                                                  title: Text(
                                                      '${controller.product.value.style[i].name}',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontSize: 20.h,
                                                      )),
                                                  groupValue: controller.product
                                                      .value.selectedStyleId,
                                                  onChanged: (v) {
                                                    setState(() {
                                                      controller.product.value
                                                          .selectedStyleId = i;
                                                    });
                                                  });
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.sauce.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sauce',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.sauce.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          ColorConstants
                                                              .primaryColor,
                                                      value: controller
                                                          .product
                                                          .value
                                                          .sauce[i]
                                                          .selected,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          controller
                                                                  .product
                                                                  .value
                                                                  .sauce[i]
                                                                  .selected =
                                                              !controller
                                                                  .product
                                                                  .value
                                                                  .sauce[i]
                                                                  .selected;
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      '${controller.product.value.sauce[i].name}',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.soda.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Soda',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.soda.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          ColorConstants
                                                              .primaryColor,
                                                      value: controller
                                                          .product
                                                          .value
                                                          .soda[i]
                                                          .selected,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          controller
                                                                  .product
                                                                  .value
                                                                  .sauce[i]
                                                                  .selected =
                                                              !controller
                                                                  .product
                                                                  .value
                                                                  .soda[i]
                                                                  .selected;
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      '${controller.product.value.soda[i].name}',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.side.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Side',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.side.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          ColorConstants
                                                              .primaryColor,
                                                      value: controller
                                                          .product
                                                          .value
                                                          .side[i]
                                                          .selected,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          controller
                                                                  .product
                                                                  .value
                                                                  .side[i]
                                                                  .selected =
                                                              !controller
                                                                  .product
                                                                  .value
                                                                  .side[i]
                                                                  .selected;
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      '${controller.product.value.side[i].name}',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.extra.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Extra',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.extra.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          ColorConstants
                                                              .primaryColor,
                                                      value: controller
                                                          .product
                                                          .value
                                                          .extra[i]
                                                          .selected,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          controller
                                                                  .product
                                                                  .value
                                                                  .sauce[i]
                                                                  .selected =
                                                              !controller
                                                                  .product
                                                                  .value
                                                                  .extra[i]
                                                                  .selected;
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      '${controller.product.value.extra[i].name}',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.preparation.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Preparation',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.preparation.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return RadioListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  value: i,
                                                  activeColor: ColorConstants
                                                      .primaryColor,
                                                  selected: (controller
                                                              .product
                                                              .value
                                                              .selectedPreparationId ==
                                                          i)
                                                      ? true
                                                      : false,
                                                  title: Text(
                                                      '${controller.product.value.preparation[i].name}',
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                      )),
                                                  groupValue: controller
                                                      .product
                                                      .value
                                                      .selectedPreparationId,
                                                  onChanged: (v) {
                                                    setState(() {
                                                      controller.product.value
                                                          .selectedPreparationId = i;
                                                    });
                                                  });
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.bacon.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bacon',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.bacon.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          ColorConstants
                                                              .primaryColor,
                                                      value: controller
                                                          .product
                                                          .value
                                                          .bacon[i]
                                                          .selected,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          controller
                                                                  .product
                                                                  .value
                                                                  .sauce[i]
                                                                  .selected =
                                                              !controller
                                                                  .product
                                                                  .value
                                                                  .bacon[i]
                                                                  .selected;
                                                        });
                                                      }),
                                                  Expanded(
                                                    child: Text(
                                                      '${controller.product.value.bacon[i].name}',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          (controller.product.value.meal.length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Meal',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      child: GridView.builder(
                                          itemCount: controller
                                              .product.value.meal.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisExtent: 50,
                                                  mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return RadioListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  value: i,
                                                  activeColor: ColorConstants
                                                      .primaryColor,
                                                  selected: (controller
                                                              .product
                                                              .value
                                                              .selectedMealId ==
                                                          i)
                                                      ? true
                                                      : false,
                                                  title: Text(
                                                      '${controller.product.value.meal[i].name}',
                                                      style: TextStyle(
                                                        fontSize: 16.h,
                                                      )),
                                                  groupValue: controller.product
                                                      .value.selectedMealId,
                                                  onChanged: (v) {
                                                    setState(() {
                                                      controller.product.value
                                                          .selectedMealId = i;
                                                    });
                                                  });
                                            });
                                          }),
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ComboScreenViewOne(
                                  id: controller.product.value.id!));
                            },
                            child: CustomWidget.CustomPrimaryButton(
                                context: context,
                                height: 60.h,
                                width: 282.w,
                                borderColor: ColorConstants.priceborderColor,
                                title: 'Make it combo',
                                titlecolor: Colors.white,
                                titlefontSize: 24.sp,
                                borderradius: 5,
                                backgroundcolor:
                                    ColorConstants.priceborderColor,
                                titleFontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(ItemCustomisePage(
                                  id: controller.product.value.id!));
                              // Navigator.pushNamed(context, '/itemcustomisePage',
                              //     arguments: PageRouteArguments(
                              //         data: [],
                              //         fromPage: 'itempage',
                              //         toPage: 'itemcustomisePage'));
                            },
                            child: CustomWidget.CustomPrimaryButton(
                                context: context,
                                height: 60.h,
                                width: 282.w,
                                borderColor:
                                    ColorConstants.bannerHeadingTextColor,
                                title: 'Customise',
                                titlecolor: Colors.white,
                                titlefontSize: 24.sp,
                                borderradius: 5,
                                backgroundcolor:
                                    ColorConstants.bannerHeadingTextColor,
                                titleFontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomWidget.CustomPrimaryButton(
                          context: context,
                          height: 60.h,
                          width: double.infinity,
                          borderColor: ColorConstants.primaryButtonColor,
                          title: 'Add to cart',
                          titlecolor: Colors.white,
                          titlefontSize: 24.sp,
                          borderradius: 5,
                          backgroundcolor: ColorConstants.primaryButtonColor,
                          titleFontWeight: FontWeight.w700),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
