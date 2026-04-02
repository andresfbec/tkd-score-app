import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/headquarters_entity.dart';
import '../../domain/usecases/headquarters/create_headquarter.dart';
import '../../domain/usecases/headquarters/update_headquarter.dart';
import '../../domain/usecases/headquarters/delete_headquarter.dart';
import '../../domain/usecases/headquarters/get_all_headquarters.dart';
import '../../domain/usecases/headquarters/find_headquarters.dart';
import '../../domain/usecases/headquarters/watch_headquarters.dart';

class HeadquartersController extends ChangeNotifier {
  final CreateHeadquarter create;
  final UpdateHeadquarter update;
  final DeleteHeadquarter delete;
  final GetAllHeadquarters getAll;
  final FindHeadquarters find;
  final WatchHeadquarters watch;

  HeadquartersController(
    this.create,
    this.update,
    this.delete,
    this.getAll,
    this.find,
    this.watch,
  );

  // STATE
  List<HeadquartersEntity> _allHeadquarters = [];
  bool isLoading = false;
  String? errorMessage;

  String _searchQuery = "";

  StreamSubscription<List<HeadquartersEntity>>? _subscription;

  // Getter para la tabla (aplica filtros de búsqueda)
  List<HeadquartersEntity> get filteredHeadquarters {
    if (_searchQuery.isEmpty) return _allHeadquarters;

    final query = _searchQuery.toLowerCase();
    return _allHeadquarters.where((h) {
      return h.name.toLowerCase().contains(query) ||
          h.city.toLowerCase().contains(query) ||
          h.address.toLowerCase().contains(query);
    }).toList();
  }

  // INIT (STREAM)
  void startListening() {
    isLoading = true;
    notifyListeners();

    _subscription?.cancel(); // cancelar conexion previa (si existe)
    _subscription = watch().listen(
      (data) {
        _allHeadquarters = data;
        isLoading = false;
        notifyListeners();
      },
      onError: (error) {
        errorMessage = error.toString();
        isLoading = false;
        notifyListeners();
      },
    );
  }

  // CREATE
  Future<void> createHeadquarter({
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      await create(
        HeadquartersEntity(
          id: null,
          name: name,
          address: address,
          city: city,
          phoneNumber: phone,
        ),
      );

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  // UPDATE ("PATCH")
  Future<void> updateHeadquarter({
    required int id,
    String? name,
    String? address,
    String? city,
    String? phone,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      await update(id, name: name, address: address, city: city, phone: phone);

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  // DELETE
  Future<void> deleteHeadquarter(int id) async {
    try {
      isLoading = true;
      notifyListeners();

      await delete(id);

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  // FIND (FILTROS)
  Future<void> search({String? name, String? city, String? address}) async {
    // No usarlo ya que usamos updateSearch
    try {
      isLoading = true;
      notifyListeners();

      final result = await find(name: name, city: city, address: address);

      _allHeadquarters = result;
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }


  /// SECONDARY METHODS

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // LIMPIAR FILTRO (volver a stream)
  void reset() {
    startListening();
  }

  // CLEANUP
  @override
  void dispose() {
    _subscription?.cancel(); // cancelar conexion activa al stream
    super.dispose();
  }

  void clearError() {
    // Limpiar mensajes de error
    errorMessage = null;
  }
}
