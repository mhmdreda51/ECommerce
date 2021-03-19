import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StanderdDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          RadioListTile<Delivery>(
            value: Delivery.StanderdDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            activeColor: primaryColor,
            subtitle: CustomText(
              text: "\n Order will be delivered between 3-5 business days",
              fontSize: 16,
            ),
            title: CustomText(
              text: "Standard Delivery",
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: null,
            onChanged: (Delivery value) {},
            activeColor: primaryColor,
            subtitle: CustomText(
              text:
                  "\n Place your order before 6pm and your item will be delivered the next day",
              fontSize: 16,
            ),
            title: CustomText(
              text: "Standard Delivery",
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: null,
            onChanged: (Delivery value) {},
            activeColor: primaryColor,
            subtitle: CustomText(
              text:
                  "\n Pick a particular date from the calendary and order will be deliverd on selected date",
              fontSize: 16,
            ),
            title: CustomText(
              text: "Standard Delivery",
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
