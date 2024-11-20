import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrentBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel? selectedCurrency;  // Variável do tipo CurrencyModel
  final void Function(CurrencyModel? model)? onChanged;
  const CurrentBox({
    super.key,
    required this.items,
    required this.controller,
    required this.selectedCurrency,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedCurrency,  // Usando o valor selecionado passado no construtor
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items.map((e) {
                return DropdownMenuItem<CurrencyModel>(
                  value: e,  // Passando o objeto CurrencyModel como valor
                  child: Text(e.name ?? 'nao disponivel'),  // Exibindo o nome da moeda
                );
              }).toList(),
              onChanged: onChanged,  // Chamando o callback quando a moeda for alterada
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,  // Usando o controlador passado como parâmetro
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
