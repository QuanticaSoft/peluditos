
import 'package:flutter/material.dart' show AppLifecycleState;

import 'package:flutter_riverpod/legacy.dart' show StateProvider;


/*
    resumed
    inactive
    paused
    detached
*/ 

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  
  return AppLifecycleState.resumed;

});