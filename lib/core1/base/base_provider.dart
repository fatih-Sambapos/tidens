import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  //yuklenmiyor mu
  bool isLoading = true;
  bool hasError = false;
  String errorMsg = 'Error';

  set setLoading(bool val) {
    if (val == isLoading) return;
    isLoading = val;
    notifyListeners();
  }

  set setError(bool val) {
    if (val == hasError) return;
    hasError = val;
    notifyListeners();
  }
}