import 'package:calculadora_de_area/CustomSwitch.dart';
import 'package:flutter/material.dart';

// O widget principal da tela onde o cálculo será realizado
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Calculadora de Área de Triângulo'}); // Título agora pode ser passado no construtor

  // Título da página, que pode ser passado como parâmetro
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Estado do widget, onde a lógica de cálculo e renderização da UI está
class _MyHomePageState extends State<MyHomePage> {
  // Variável para armazenar a resposta (a área ou a mensagem de erro)
  String? resposta;

  // Controladores para os campos de entrada (base e altura)
  TextEditingController controleB = TextEditingController();
  TextEditingController controleH = TextEditingController();

  // Função para calcular a área do triângulo
  void calcularA() {
    // Atualiza o estado (força a re-renderização da UI)
    setState(() {
      // Tenta converter os valores inseridos para números do tipo double
      double? base = double.tryParse(controleB.text);
      double? altura = double.tryParse(controleH.text);

      // Verifica se ambos os valores (base e altura) são válidos
      if (base != null && altura != null) {
        // Se válidos, calcula a área do triângulo
        double areaCalculada = (base * altura) / 2;

        // Atualiza a resposta para exibir a área calculada
        resposta = 'A área do triângulo é: ${areaCalculada.toStringAsFixed(2)}';
      } else {
        // Se algum valor for inválido (null), mostra mensagem de erro
        resposta = 'Digite valores válidos para a base e altura.';
      }
    });
  }

  // Função de construção da interface do usuário (UI)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar é a barra de título da página
      appBar: AppBar(
        title: Text(widget.title), // Usa o título do widget (passado no construtor)
        actions: [CustomSwitch()],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // Corpo da tela onde os widgets são dispostos
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding para dar espaçamento
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha o conteúdo no centro
          children: [
            CustomSwitch(),
            // Campo de entrada para a base do triângulo
            TextField(
              controller: controleB, // Controlador do campo de base
              decoration: InputDecoration(
                labelText: 'Base do triângulo', // Texto explicativo no campo
                border: OutlineInputBorder(), // Bordas arredondadas
              ),
              keyboardType: TextInputType.number, // Permite apenas números
            ),
            const SizedBox(height: 16), // Espaçamento  entre os campos
            // Campo de entrada para a altura do triângulo
            TextField(
              controller: controleH, // Controlador do campo de altura
              decoration: InputDecoration(
                labelText: 'Altura do triângulo', // Texto explicativo no campo
                border: OutlineInputBorder(), // Bordas arredondadas
              ),
              keyboardType: TextInputType.number, // Permite apenas números
            ),
            const SizedBox(height: 16), // Espaçamento entre os campos
            // Botão para calcular a área
            ElevatedButton(
              onPressed: calcularA, // Quando pressionado, chama a função calcularA
              child: const Text('Calcular'), // Texto do botão
            ),
            const SizedBox(height: 16), // Espaçamento antes da resposta
            // Exibe a resposta, se houver
            if (resposta != null)
              Text(
                resposta!, // Exibe a resposta ou mensagem de erro
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Estilo da resposta
              ),
          ],
        ),
      ),
    );
  }
}
