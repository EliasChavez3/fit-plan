import 'package:fit_plan_proyecto/paginas/Notas/nota.dart';
import 'package:flutter/material.dart';

class CrearNotaScreen extends StatelessWidget {
  final Function(Nota) onSave;

  CrearNotaScreen({super.key, required this.onSave});

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Nueva Nota'),
      backgroundColor: const Color(0xffffa07a),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título de la nota',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _contenidoController,
              decoration: InputDecoration(
                labelText: 'Escribe tu nota aquí',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLines: 8,
              minLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función onSave con un objeto Nota
                Nota nuevaNota = Nota(
                  titulo: _tituloController.text,
                  contenido: _contenidoController.text,
                );
                onSave(nuevaNota);
                Navigator.pop(context); // Volver a la pantalla anterior
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 242, 239, 237),
                backgroundColor: const Color(0xffffa07a),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Guardar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
