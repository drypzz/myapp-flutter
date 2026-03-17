import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CartaoVisita());
}

class CartaoVisita extends StatelessWidget {
  const CartaoVisita({super.key});

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir o link $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartão de Visita',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 53, 153, 204),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15.0,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/me.webp'),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Gustavo Adriano Alves Palmeira',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Desenvolvedor(a) Full Stack | Analista de Suporte',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue[800],
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Divider(color: Colors.black12, thickness: 1.5),
                ),
                _buildContatoRow(
                  Icons.email,
                  'gustavo.palmeira@alunos.senac.br',
                ),
                const SizedBox(height: 12.0),
                _buildContatoRow(Icons.phone, '+55 (47) 9 975950-5023'),
                const SizedBox(height: 24.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                      color: Colors.pink[700],
                      iconSize: 30,
                      onPressed: () {
                        _openLink('https://instagram.com/_gustavoaap');
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.blue[800],
                      iconSize: 30,
                      onPressed: () {
                        _openLink('https://linkedin.com/in/gustavoaap');
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      color: Colors.black87,
                      iconSize: 30,
                      onPressed: () {
                        _openLink('https://github.com/drypzz');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContatoRow(IconData icone, String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, color: Colors.blue[800], size: 20),
        const SizedBox(width: 12.0),
        Text(
          texto,
          style: const TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ],
    );
  }
}
