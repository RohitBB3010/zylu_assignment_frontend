import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:zylu_assignment_frontend/components/loading_page.dart';
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
              return const LoadingPage();
            }

            if (state is VehiclesLoadedState) {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    backgroundColor: const Color(0xff55286f),
                    title: const AutoSizeText(
                      'Vehicles List',
                      style: TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText('Welcome John Doe',
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: 'PoppinsBold', fontSize: 25)),
                        const AutoSizeText(
                            'Below is list of vehicles color coded based on following categories : ',
                            maxLines: 2,
                            style: TextStyle(fontFamily: 'Lato', fontSize: 18)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)),
                          child: Column(
                            children: [
                              tagInstruction(context, Colors.green,
                                  'All vehicles with mileage greater than 15 km/l and not older than 5 years'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.008,
                              ),
                              tagInstruction(context, Colors.amber,
                                  'All vehicles with mileage greater than 15 km/l but older than 5 years'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.008,
                              ),
                              tagInstruction(
                                  context, Colors.red, 'All other vehicles')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Expanded(
                          child: ListView(
                              shrinkWrap: true,
                              children: state.vehicles.map(
                                (e) {
                                  return vehiclesCard(e, context);
                                },
                              ).toList()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const AutoSizeText("Final case");
          },
        ));
  }

  Widget tagInstruction(
      BuildContext context, Color colorCode, String categoryText) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.05,
          height: MediaQuery.of(context).size.width * 0.05,
          decoration: BoxDecoration(
              color: colorCode,
              border: Border.all(color: Colors.white, width: 2)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Expanded(
          child: AutoSizeText(
            categoryText,
            maxLines: 2,
            style: const TextStyle(fontFamily: 'Lato', fontSize: 15),
          ),
        )
      ],
    );
  }
}
