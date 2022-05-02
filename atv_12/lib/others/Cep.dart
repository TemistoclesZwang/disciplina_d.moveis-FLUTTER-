class Cep {
  final String ?bairro;
  final String ?cidade;
  final String ?logradouro;

  var news;

  // News({this.userId, this.id, this.title});
  Cep ({this.bairro, this.cidade,this.logradouro});
  
  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      // userId: json['userId'],
      // id: json['id'],
      // title: json['title'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      logradouro: json['logradouro'],
    );
  }
}
