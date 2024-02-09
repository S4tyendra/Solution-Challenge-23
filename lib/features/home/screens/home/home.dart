// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:solution_challenge_app/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge_app/common/widgets/custom_shapes/container/circle_cutsom_shape.dart';
import 'package:solution_challenge_app/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:solution_challenge_app/common/widgets/custom_shapes/curved_edges/curved_edges-widget.dart';
import 'package:solution_challenge_app/common/widgets/custom_shapes/curved_edges/curved_edges_clipper.dart';
import 'package:solution_challenge_app/utils/helpers/helper_function.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const circleBgColor = Color.fromARGB(255, 195, 225, 255);

    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryHeaderContainer(
                  circleBgColor: circleBgColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: CustomAppBar(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back,',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Shiwang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/appbar/shiwang_profile_photo.jpg'),
                                      fit: BoxFit.cover,
                                      // alignment: Alignment.topLeft,
                                    )))
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
