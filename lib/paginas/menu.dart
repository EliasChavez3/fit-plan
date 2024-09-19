import 'package:fit_plan_proyecto/paginas/Notas/ListaNotasScreen.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA07A), // Light Salmon color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildUserProfile(),
          SizedBox(height: 20),
          Expanded(child: _buildMenuGrid(context)),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Color(0xFFFFA07A)),
      ),
      title: Text(
        'Usuario',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Perfil',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    final menuItems = [
      {'icon': Icons.lightbulb_outline, 'label': 'Tips', 'page': null}, // Añadir la página correspondiente
      {'icon': Icons.chat_bubble_outline, 'label': 'Chat de entrenamiento...', 'page': null}, // Añadir la página correspondiente
      {'icon': Icons.description_outlined, 'label': 'Plan de entrenamiento...', 'page': null}, // Añadir la página correspondiente
      {'icon': Icons.timer, 'label': 'Cronometro', 'page': Cronometro()},
      {'icon': Icons.restaurant_menu, 'label': 'Comidas', 'page': null}, // Añadir la página correspondiente
      {'icon': Icons.calendar_today, 'label': 'Horarios', 'page': Calendario()},
      {'icon': Icons.settings, 'label': 'Configuraciones', 'page': null}, // Añadir la página correspondiente
    ];

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return _buildMenuItem(context, menuItems[index]['icon'] as IconData, menuItems[index]['label'] as String, menuItems[index]['page'] as Widget?);
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30, color: Color(0xFFFFA07A)),
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}