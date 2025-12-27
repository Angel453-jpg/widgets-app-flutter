import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;

  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(selectedTransportation.name),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (Transportation? value) {
                if (value == null) return;
                setState(() {
                  selectedTransportation = value;
                });
              },
              child: Column(
                children: const [
                  RadioListTile(
                    title: Text('By car'),
                    subtitle: Text('Viajar por carro'),
                    value: Transportation.car,
                  ),
                  RadioListTile(
                    title: Text('By boat'),
                    subtitle: Text('Viajar por bote'),
                    value: Transportation.boat,
                  ),
                  RadioListTile(
                    title: Text('By plane'),
                    subtitle: Text('Viajar por avión'),
                    value: Transportation.plane,
                  ),
                  RadioListTile(
                    title: Text('By submarine'),
                    subtitle: Text('Viajar por submarino'),
                    value: Transportation.submarine,
                  ),
                ],
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantDinner,
          onChanged: (value) => setState(() {
            wantDinner = !wantDinner;
          }),
        ),
      ],
    );
  }
}
