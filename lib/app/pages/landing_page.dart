import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/app/pages/home_page.dart';
import 'package:test_pro_mobile_app/viewmodel/view_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);

    if (_viewModel.viewState == ViewState.IDLE) {
      return const HomePage();
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
