import 'package:easy_stepper/easy_stepper.dart';
import 'package:financial_app/features/profile/bloc/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepperSection extends StatelessWidget {
  const StepperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final currentIndex = state.pageIndex;
        return SizedBox(
          height: 100,
          child: EasyStepper(
            activeStep: currentIndex,
            enableStepTapping: true,
            showLoadingAnimation: false,
            lineStyle: LineStyle(
              lineType: LineType.normal,
              lineLength: MediaQuery.of(context).size.width / 4.4,
              activeLineColor: Colors.amber,
              unreachedLineColor: Colors.amber.withOpacity(0.3),
            ),
            unreachedStepBackgroundColor: Colors.amber.withOpacity(0.3),
            unreachedStepBorderColor: Colors.amber.withOpacity(0.3),
            unreachedStepTextColor: Colors.white,
            activeStepBackgroundColor: Colors.amber,
            activeStepBorderColor: Colors.amber,
            finishedStepBackgroundColor: Colors.amber,
            finishedStepBorderColor: Colors.amber,
            onStepReached: (index) {
              context.read<ProfileCubit>().pageIndex(index);
            },
            steps: [
              EasyStep(
                customStep: Text(
                  "1",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
              EasyStep(
                customStep: Text(
                  "2",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
              EasyStep(
                customStep: Text(
                  "3",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
