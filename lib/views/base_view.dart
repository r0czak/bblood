import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';
import '../viewmodels/base_model.dart';

class BaseView<T extends BaseModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  BaseView({required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => locator<T>(),
        child: Consumer<T>(builder: builder));
  }
}
