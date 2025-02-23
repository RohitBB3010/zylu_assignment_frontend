import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zylu_assignment_frontend/models/vehicles_model.dart';

Widget vehiclesCard(Vehicle vehicle, BuildContext context) {
  return Center(
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ], color: vehicle.color, borderRadius: BorderRadius.circular(10)),
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.007),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              vehicle.name,
              maxLines: 1,
              style: const TextStyle(
                  fontFamily: 'Lato', fontSize: 23, color: Colors.white),
            ),
            AutoSizeText(
              'Mileage : ${vehicle.mileage} km/l',
              style: const TextStyle(
                  fontFamily: 'Lato', color: Colors.white, fontSize: 15),
            ),
            AutoSizeText(
              'Manufacture Date : ${DateFormat('d MMMM yyyy').format(vehicle.manufactureDate)}',
              style: const TextStyle(
                  fontFamily: 'Lato', color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    ),
  );
}
