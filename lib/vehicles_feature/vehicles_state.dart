import 'package:zylu_assignment_frontend/models/vehicles_model.dart';

class VehiclesState {}

class VehiclesLoadingState extends VehiclesState {}

class VehiclesLoadedState extends VehiclesState {
  List<Vehicle> vehicles;

  VehiclesLoadedState({required this.vehicles});
}

class VehiclesErrorState extends VehiclesState {
  final String error;

  VehiclesErrorState({required this.error});
}
