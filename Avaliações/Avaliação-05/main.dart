import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  // Substitua pelos seus dados
  String username = 'rocharuth120@gmail.com'; // Seu e-mail
  String password = 'cpzq rylg dicv lkaf'; // Sua senha ou app password (para Gmail)

  // Configura o servidor SMTP (exemplo com Gmail)
  final smtpServer = gmail(username, password);

  // Criação do e-mail
  final message = Message()
    ..from = Address(username, 'Ruth Rodrigues') // Remetente
    ..recipients.add('ruth.rodrigues10@aluno.ifce.edu.br') // Destinatário
    ..subject = 'Realizando a atividade 05' // Assunto
    ..text = 'Teste de envio de e-mail via API do Gmail em Dart.';

  try {
    // Envio do e-mail
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com sucesso: ${sendReport.toString()}');
  } catch (e) {
    print('Falha ao enviar o e-mail: $e');
  }
}