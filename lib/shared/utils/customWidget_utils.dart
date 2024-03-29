import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../../modules/check_out/ui/check_out_view.dart';

class CustomWidget {
  static CustomButton({required String text, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius100),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.padding53,
            right: Dimensions.padding53,
            top: Dimensions.padding19,
            bottom: Dimensions.padding19),
        child: Text(
          text,
          style: TextStyle(
              fontSize: Dimensions.TextSize20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static CustomImageButton(
      {required String text, required Color color, required Image image}) {
    return Container(
      height: 90,
      width: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          children: [
            image,
            Spacer(),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static CustomButtonInImage({required String text, required onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 70,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorConstants.primaryButtonColor,
            ),
            child: Center(
                child: Text(
              'Eat in',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.TextSize18,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }

  static CustomItemwithPrice({Tap}) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.6,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(15, (index) {
        return GestureDetector(
          onTap: Tap != null ? Tap : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/item.png"),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue20,
              ),
              Text(
                'Chicken Burger',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.TextSize20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chicken Burger',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize18),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue25,
              ),
              Row(
                children: [
                  Text(
                    '\$9.00',
                    style: TextStyle(
                        color: ColorConstants.primaryBigTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.TextSize18),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(FeatherIcons.plus),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  static CustomTitleWithVariation({Tap}) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.6,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(15, (index) {
        return GestureDetector(
          onTap: Tap != null ? Tap : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/item.png"),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue20,
              ),
              Center(
                child: Text(
                  'Chicken Burger',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Chicken Burger',
                  style: TextStyle(
                      color: ColorConstants.primaryBigTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.TextSize18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  static CustomCloseSection({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 40,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorConstants.primaryBigTextColor.withOpacity(0.2),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.primaryBigTextColor.withOpacity(.15),
                  blurRadius: 0.2,
                  offset: Offset(1, 1))
            ]),
      ),
    );
  }

  static ItemCountSection() {
    return Row(
      children: [
        Container(
            height: 24,
            width: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
                border: Border.all(color: ColorConstants.primaryBigTextColor)),
            child: Icon(
              FeatherIcons.minus,
              size: Dimensions.TextSize15,
              color: ColorConstants.primaryBigTextColor,
            )),
        SizedBox(
          width: Dimensions.SizedBoxValue25,
        ),
        Text(
          '2',
          style: TextStyle(
              fontSize: Dimensions.TextSize30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: Dimensions.SizedBoxValue25,
        ),
        Container(
            height: 24,
            width: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: ColorConstants.bannerHeadingTextColor,
                border:
                    Border.all(color: ColorConstants.bannerHeadingTextColor)),
            child: Icon(
              FeatherIcons.plus,
              size: Dimensions.TextSize15,
              color: Colors.white,
            )),
      ],
    );
  }

  static CustomcustomiseButton(
      {height, width, context, onTap, text = 'Customise'}) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                ColorConstants.bannerHeadingTextColor)),
        child: Text(
          text,
          style: TextStyle(fontSize: Dimensions.TextSize30),
        ),
      ),
    );
  }

  static CustomAddtoCartButton(
      {height, width, context, ontap, text = 'Add to cart'}) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: ontap != null ? ontap : null,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor)),
        child: Text(
          text,
          style:
              TextStyle(fontSize: Dimensions.TextSize30, color: Colors.white),
        ),
      ),
    );
  }

  static CustomRedButton({height, width, context, ontap, text}) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: ontap != null ? ontap : null,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(ColorConstants.redButtonColor)),
        child: Text(
          text,
          style:
              TextStyle(fontSize: Dimensions.TextSize30, color: Colors.white),
        ),
      ),
    );
  }

  static CustomOrderView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height65,
              // width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: ColorConstants.primaryButtonColor),
              ),
              child: Image(
                image: AssetImage('assets/images/bug.png'),
                height: Dimensions.height60,
                width: Dimensions.width70,
              ),
            ),
            SizedBox(
              width: Dimensions.SizedBoxValue20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Beef Burger',
                  style: TextStyle(
                      fontSize: Dimensions.TextSize20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 150,
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue15,
                ),
                Text(
                  '+ 1 Beef patty',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.TextSize15,
                      color:
                          ColorConstants.primaryBigTextColor.withOpacity(0.5)),
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue10,
                ),
              ],
            ),
            SizedBox(
              width: Dimensions.SizedBoxValue30,
            ),
            Text(
              '2X \$18.00',
              style: TextStyle(
                fontSize: Dimensions.SizedBoxValue20,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: Dimensions.height25,
              width: Dimensions.width85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(96),
                color: ColorConstants.bannerHeadingTextColor,
              ),
              child: Center(
                child: Text(
                  'Customise',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
            color: ColorConstants.bannerBackgroundColor,
            height: 8,
            endIndent: 100,
            indent: 165),
      ],
    );
  }

  static CustomCartModalBottomSheet({context}) {
    return Column(
      children: [
        Container(
          height: Dimensions.height80,
          color: ColorConstants.primaryBigTextColor.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
            child: Row(
              children: [
                Text(
                  'My order (Eat in)',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.TextSize25),
                ),
                Spacer(),
                Text(
                  'Total:  \$72.00',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.TextSize25),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.SizedBoxValue30,
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
            child: GridView.count(
              //  shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 3,
              physics: ScrollPhysics(),
              children: List.generate(
                70,
                (index) {
                  return CustomWidget.CustomOrderView();
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
            child: Row(
              children: [
                CustomWidget.CustomRedButton(
                    height: 60.0,
                    width: 320.0,
                    text: 'Cancel Order',
                    context: context),
                Spacer(),
                CustomWidget.CustomAddtoCartButton(
                    height: 60.0,
                    width: 320.0,
                    text: 'Done',
                    context: context,
                    ontap: () {
                      Get.to(CheckoutScreen());
                    }),
              ],
            ),
          ),
        )
      ],
    );
  }

  static CustomPrimaryButton(
      {context,
      height,
      width,
      title,
      borderradius,
      backgroundcolor,
      titlecolor = Colors.white,
      Color? borderColor}) {
    return Container(
      height: height * 1.0,
      width: width * 1.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderradius*1.0),
          color: backgroundcolor),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: titlecolor),
        ),
      ),
    );
  }

  static CustomComboPackName({context, img, flag}) {
    return Container(
      height: 92,
      width: 342,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: ColorConstants.selectedDesire),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            img,
            SizedBox(
              width: 15,
            ),
            Text(
              flag == 0
                  ? 'Small Combo'
                  : flag == 1
                      ? 'Medium Combo'
                      : 'Large Combo',
              style: TextStyle(
                  color: ColorConstants.primaryBigTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  static CustomComboPackItem({context, image}) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          image,
          SizedBox(
            height: Dimensions.SizedBoxValue20,
          ),
          Text(
            'Chicken Burger',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.TextSize20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Chicken Burger',
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.TextSize18),
          ),
          SizedBox(
            height: Dimensions.SizedBoxValue25,
          ),
          Row(
            children: [
              Text(
                '\$9.00',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize18),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(FeatherIcons.plus),
              )
            ],
          )
        ],
      ),
    );
  }

  static CustomComboCart(
      {context, itemName, extraItemName, quantity, Itemprice}) {
    List count = [1, 2, 3, 4, 5];
    return Column(children: [
      Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.primaryBigTextColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
          child: Row(
            children: [
              Text(
                'My order (Eat in)',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              Spacer(),
              Text(
                'Total:  \$20.00',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        height: 200,
        child: ResponsiveGridList(
            desiredItemWidth: 200,
            minSpacing: 40,
            children: count.map((i) {
              return Container(
                  height: 90,
                  alignment: Alignment(0, 0),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorConstants.cartImageBorderColor),
                          ),
                          child: Image(
                            image: AssetImage("assets/images/bug.png"),
                            height: 60,
                            width: 80,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Beef Burger',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 7,),
                          Text('+ 1 Beef patty',style: TextStyle(color: ColorConstants.primaryBigTextColor.withOpacity(0.5)),),
                          SizedBox(height: 7,),
                          Text('1X    \$9.00',style: TextStyle(color: ColorConstants.primaryBigTextColor,fontSize: 16),)
                        ],
                      )
                    ],
                  ));
            }).toList()),
      ),
    ]);
  }
}
