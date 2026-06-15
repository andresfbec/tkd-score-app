import 'package:flutter/material.dart';
import '../../domain/entities/point_types_entity.dart';
import '../../domain/usecases/point_types/get_all_point_types.dart';
import '../../core/enums/status.dart';

class PointTypesController extends ChangeNotifier {
  final GetAllPointTypes getAllUseCase;

  PointTypesController({required this.getAllUseCase});

  List<PointTypesEntity> _pointTypes = [];
  Status status = Status.idle;
  String? message;

  List<PointTypesEntity> get pointTypes => _pointTypes;

  Future<void> loadPointTypes() async {
    try {
      status = Status.loading;
      notifyListeners();

      _pointTypes = await getAllUseCase();
      
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }
}
