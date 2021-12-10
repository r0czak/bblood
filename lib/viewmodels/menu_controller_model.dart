import 'dart:io';

import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class MenuControllerModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  late String errorMessage;

  Future<bool> onWillPop(context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Chcesz zamknąć aplikację?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => _navigationService.pop(),
                child: const Text('Nie'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: const Text('Tak'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
