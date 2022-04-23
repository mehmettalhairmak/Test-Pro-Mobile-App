// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/locator.dart';
import 'package:test_pro_mobile_app/repository/repository.dart';
import 'package:test_pro_mobile_app/services/authentication/authentication_base.dart';

enum ViewState { IDLE, BUSY }

class ViewModel with ChangeNotifier implements AuthBase {
  ViewState _viewState = ViewState.IDLE;

  final Repository _userRepository = locator<Repository>();

  UserModel? _user;
  String? emailErrorMessage;
  String? passwordErrorMessage;
  UserModel? get user => _user;
  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    try {
      viewState = ViewState.BUSY;
      _user = await _userRepository.signInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("ViewModel signInAnonymously Hata : ${e.toString()}");
      return null;
    } finally {
      viewState = ViewState.IDLE;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      viewState = ViewState.BUSY;
      bool value = await _userRepository.signOut();
      _user = null;
      return value;
    } catch (e) {
      debugPrint("ViewModel signOut Hata : ${e.toString()}");
      return false;
    } finally {
      viewState = ViewState.IDLE;
    }
  }

  @override
  Future<UserModel?> signInWithEmailPassword(
      String email, String password) async {
    try {
      if (checkEmailPassword(email, password)) {
        viewState = ViewState.BUSY;
        _user = await _userRepository.signInWithEmailPassword(email, password);
        return _user;
      } else {
        return null;
      }
    } finally {
      viewState = ViewState.IDLE;
    }
  }

  @override
  Future<UserModel?> signUpWithEmailPassword(
      String email, String password) async {
    if (checkEmailPassword(email, password)) {
      try {
        viewState = ViewState.BUSY;
        _user = await _userRepository.signUpWithEmailPassword(email, password);
        return _user;
      } finally {
        viewState = ViewState.IDLE;
      }
    } else {
      return null;
    }
  }

  bool checkEmailPassword(String email, String password) {
    var result = true;

    if (password.length < 6) {
      passwordErrorMessage = "There must be at least 6 characters";
      result = false;
    } else {
      passwordErrorMessage = null;
    }
    if (!email.contains('@')) {
      emailErrorMessage = "Invalid email address";
      result = false;
    } else {
      emailErrorMessage = null;
    }

    return result;
  }
}
