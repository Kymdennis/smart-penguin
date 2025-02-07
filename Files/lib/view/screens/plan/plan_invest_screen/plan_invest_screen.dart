import 'package:flutter/material.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/view/components/appbar/custom_appbar.dart';

class PlanInvestScreen extends StatelessWidget {
  const PlanInvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: MyStrings.investmentPlan),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimensions.screenPaddingHV,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
