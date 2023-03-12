import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/opacity_provider.dart';

class ColorOpacitySlider extends StatefulWidget {
  const ColorOpacitySlider({super.key});

  @override
  State<ColorOpacitySlider> createState() => _ColorOpacitySliderState();
}

class _ColorOpacitySliderState extends State<ColorOpacitySlider> {
  @override
  Widget build(BuildContext context) {
    final opacityProvider =
        Provider.of<OpacityProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Opacity Slider"),
      ),
      body: Column(
        children: [
          Consumer<OpacityProvider>(builder: (context, value, child) {
            return Slider(
                max: 1,
                min: 0,
                value: value.value,
                onChanged: (val) {
                  print(opacityProvider.value);
                  value.setValue(val);
                });
          }),
          Consumer<OpacityProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.blue.withOpacity(opacityProvider.value),
                    child: const Center(child: Text("Blue")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.purple.withOpacity(opacityProvider.value),
                    child: const Center(child: Text("Purple")),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
