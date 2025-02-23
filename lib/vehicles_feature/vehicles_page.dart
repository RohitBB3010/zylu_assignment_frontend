import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:zylu_assignment_frontend/components/vehicles_card.dart';
import 'package:zylu_assignment_frontend/vehicles_feature/vehicles_cubit.dart';
import 'package:zylu_assignment_frontend/vehicles_feature/vehicles_state.dart';

class VehiclesPage extends StatelessWidget {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VehiclesCubit()..fetchVehiclesData(),
        child: BlocBuilder<VehiclesCubit, VehiclesState>(
          builder: (context, state) {
            if (state is VehiclesLoadingState) {
              return const Scaffold(
                body: Center(
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballGridBeat,
                  ),
                ),
              );
            }

            if (state is VehiclesLoadedState) {
              return SafeArea(
                child: Scaffold(
                  body: ListView(
                      shrinkWrap: true,
                      children: state.vehicles.map(
                        (e) {
                          return vehiclesCard(e, context);
                        },
                      ).toList()),
                ),
              );
            }

            return const AutoSizeText("Final case");
          },
        ));
  }
}
