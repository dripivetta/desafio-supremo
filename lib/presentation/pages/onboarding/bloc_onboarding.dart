

import 'package:flutter/material.dart';

class Onboarding {
  final pageController = PageController();
 int currentPage = 0;

  changePage (int page) {
    currentPage = page;
  }

} 