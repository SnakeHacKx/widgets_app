import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snack_bar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Id magna ad nisi nulla consequat exercitation pariatur. Cillum eiusmod irure ex ad veniam Lorem. Velit voluptate ipsum duis ipsum duis sit laboris est consectetur ut ullamco.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Sit laboris consectetur ipsum nulla voluptate adipisicing ex quis mollit veniam Lorem adipisicing quis. Culpa nostrud ex quis ut excepteur eiusmod ea voluptate. Minim aliquip occaecat eu veniam do incididunt deserunt cillum minim incididunt ipsum voluptate officia irure. Dolore Lorem amet mollit veniam minim minim tempor aliquip officia.')
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_rounded),
        label: const Text('Mostrar snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
