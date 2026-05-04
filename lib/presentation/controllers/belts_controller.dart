import 'package:flutter/material.dart';
import '../../domain/entities/belts_entity.dart';
import '../../domain/usecases/belts/get_all_belts.dart';
import '../../core/enums/status.dart';

class BeltsController extends ChangeNotifier {
  final GetAllBelts getAllUseCase;

  BeltsController({required this.getAllUseCase});

  List<BeltsEntity> _belts = [];
  Status status = Status.idle;
  String? message;

  List<BeltsEntity> get belts => _belts;

  Future<void> loadBelts() async {
    try {
      status = Status.loading;
      notifyListeners();

      _belts = await getAllUseCase();
      
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }
}
