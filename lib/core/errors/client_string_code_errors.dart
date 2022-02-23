import 'package:dio/dio.dart';

/// Describe
class ClientStringCodeErrors {
  ///No Content
  String? code_204;

  ///Not Modified
  String? code_304;

  ///Bad Request
  String? code_400;

  ///Unauthorized.
  String? code_401;

  ///Forbidden
  String? code_403;

  ///Not Found
  String? code_404;

  ///Method Not Allowed
  String? code_405;

  ///Not Acceptable
  String? code_406;

  ///Internal Server Error
  String? code_500;

  ///Erro default
  String messageDefault;

  ClientStringCodeErrors({
    required this.code_204,
    required this.code_304,
    required this.code_400,
    required this.code_401,
    required this.code_403,
    required this.code_404,
    required this.code_405,
    required this.code_406,
    required this.code_500,
    required this.messageDefault,
  });

  static ClientStringCodeErrors automaticMessages(
      {required String messageToBeReplicated, required DioError dioError}) {
    String messageDefault = _getMessageDefault(dioError);
    return ClientStringCodeErrors(
        code_204: "Nenhum(a) $messageToBeReplicated retornado do servidor.",
        code_304: "Nenhum(a) $messageToBeReplicated modificado no servidor.",
        code_400:
            "O servidor não pode processar a solicitação de $messageToBeReplicated.",
        code_401:
            "Você está sem credênciais para o servidor lhe retornar o(a) $messageToBeReplicated.",
        code_403: "O servidor recusou o pedido de $messageToBeReplicated.",
        code_404: "O servidor não encontrou o(a) $messageToBeReplicated.",
        code_405:
            "O servidor rejeitou a solicitação de $messageToBeReplicated.",
        code_406:
            "O servidor é incapaz de produzir uma representação de $messageToBeReplicated.",
        code_500:
            "O servidor encontrou uma condição inesperada e não pode atender à solicitação de $messageToBeReplicated.",
        messageDefault: messageDefault.trim().isNotEmpty
            ? messageDefault
            : "Menssagem de erro nula!");
  }

  static String _getMessageDefault(DioError dioError) {
    final data = dioError.response?.data;
    if (data == null) {
      return "A conexão demorou, verifique sua conexão com a internet!";
    }
    String firstError = "";
    if (data.runtimeType.toString() == "String") return "";
    if (data['errors'] != null) {
      Map erros = data['errors'] as Map;
      firstError = (erros.values.first?.isNotEmpty ?? false)
          ? "\n${erros.values.first[0]}"
          : "";
    }
    return "${data['message'].toString()}$firstError";
  }
}
