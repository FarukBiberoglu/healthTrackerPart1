import 'package:flutter/material.dart';
import 'package:untitled22/desing.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map<String, int> makroDegerler = {
    'Protein': 0,
    'Karbonhidrat': 0,
    'Yağ': 0,
  };

  String selectedMakro = 'Protein';
  TextEditingController degerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: makroDegerler.entries.map((entry) {
                return BesinDeger(makro: entry.key, deger: entry.value);
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setDialogState) {
                  return AlertDialog(
                    title: const Text("Makro Giriniz"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButton<String>(
                          value: selectedMakro,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setDialogState(() {
                                selectedMakro = newValue;
                              });
                            }
                          },
                          items: ['Protein', 'Karbonhidrat', 'Yağ']
                              .map<DropdownMenuItem<String>>((String oge) {
                            return DropdownMenuItem<String>(
                              value: oge,
                              child: Text(oge),
                            );
                          }).toList(),
                        ),
                        TextField(
                          controller: degerController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Değer giriniz",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (degerController.text.isNotEmpty) {
                            setState(() {
                              makroDegerler[selectedMakro] =
                                  int.parse(degerController.text);
                            });
                          }
                          degerController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("Ekle"),
                      ),
                      TextButton(
                        onPressed: () {
                          degerController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("İptal"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.purple),
      ),
    );
  }
}