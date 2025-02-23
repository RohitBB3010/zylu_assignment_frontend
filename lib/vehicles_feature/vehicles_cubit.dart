import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zylu_assignment_frontend/models/vehicles_model.dart';
import 'package:zylu_assignment_frontend/vehicles_feature/vehicles_state.dart';
import 'package:http/http.dart' as http;

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit() : super(VehiclesState());

  Future<void> fetchVehiclesData() async {
    try {
      String fetchVehiclesUrl =
          'https://zylu-assignment-backend.onrender.com/get-vehicles';

      emit(VehiclesLoadingState());

      final response = await http.get(Uri.parse(fetchVehiclesUrl));

      final int statusCode = response.statusCode;

      if (statusCode == 404) {
        emit(VehiclesErrorState(error: "No vehicles data found"));
      } else if (statusCode == 500) {
        emit(VehiclesErrorState(error: "No vehicles data found"));
      } else if (statusCode == 200) {
        debugPrint("here at 200");
        final jsonObjects = jsonDecode(response.body);

        List<Vehicle> vehiclesList = [];

        for (Map<String, dynamic> vehicleObject in jsonObjects['vehicles']) {
          Vehicle veh = Vehicle.fromJson(vehicleObject);
          veh.color = determineVehicleColorCode(veh);
          vehiclesList.add(veh);
        }

        emit(VehiclesLoadedState(vehicles: vehiclesList));
      } else {
        emit(VehiclesErrorState(error: 'Some unexpected error occured'));
      }
    } catch (err) {
      emit(VehiclesErrorState(error: 'Some unexpected error occured'));
    }
  }

  Color determineVehicleColorCode(Vehicle vehicle) {
    final vehicleAge =
        (DateTime.now().difference(vehicle.manufactureDate).inDays / 365)
            .floor();
    final int mileage = vehicle.mileage;

    if (mileage >= 15 && vehicleAge <= 5) {
      return Colors.green;
    } else if (mileage >= 15 && vehicleAge > 5) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }
}
