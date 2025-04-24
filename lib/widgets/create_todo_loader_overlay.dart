import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/placement_prediction/view_model/prediction_view_model.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreateTodoLoaderOverlay extends StatelessWidget {
  const CreateTodoLoaderOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<PredictionViewModel>().isLoading;

    if (!isLoading) return const SizedBox.shrink();
    return PopScope(
      canPop: false,
      child: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: LoadingAnimationWidget.flickr(
                  size: 100,
                  leftDotColor: Colors.teal,
                  rightDotColor: Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Getting result...',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.tealAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
