import 'package:flutter/material.dart';

abstract class BaseNavigator {}

class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier {
  NAV? navigator;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {

  late VM viewModel;
  VM initViewModel();
  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }
}
