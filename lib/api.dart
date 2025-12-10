import 'dart:io';
import 'package:flutter/foundation.dart';

class Api {
  late final String baseUrl;

  // Constructor
  Api() {
    if (kIsWeb) {
      baseUrl = 'http://localhost:5076/api/Product';
    } else if (Platform.isAndroid) {
      baseUrl = 'http://10.0.2.2:5076/api/Product';
    } else if (Platform.isIOS) {
      baseUrl = 'http://localhost:5076/api/Product';
    } else {
      // fallback
      baseUrl = 'http://localhost:5076/api/Product';
    }
  }
}
