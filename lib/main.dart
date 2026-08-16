import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:peluditos/config/config.dart';
import 'presentation/providers/providers.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addObserver(this);
    ref.read( permissionsProvider.notifier ).checkPermissions();
  }

  @override
  void dispose() {
    
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    ref.read(appStateProvider.notifier).state = state;
    //print('AppLifecycleState: $state');
    /*
      resumed: la app paso de estar del background al foreground
      inactive: la app esta en foreground pero no responde a eventos del usuario, no esta en focus
      paused: la app paso de estar del foreground al background
      detached: la app esta terminando y no se puede acceder a ella, app fue destruiuda, tenemos muy poco teimpo de reaccion para guardar informacion, se recomienda usarlo para guardar informacion en local storage
      hidden: la app esta en background y no es visible para el usuario, pero sigue corriendo, se recomienda usarlo para guardar informacion en local storage
    */
    if ( state == AppLifecycleState.resumed ) {
      ref.read( permissionsProvider.notifier ).checkPermissions();
    }
    super.didChangeAppLifecycleState(state);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }


}
