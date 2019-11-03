
class Volonteer {
  int id;
  String wie;
  String wat;
  String waar;
  String postCode;
  int dob;
  String fotoBase64;
  String aanmelder;
  DateTime lastupdated;

  Map<String, dynamic> toJson() => {
        'id': id,
        'wie': wie,
        'wat': wat,
        'waar': waar,
        'postCode': postCode,
        'dob': dob,
        'fotoBase64':fotoBase64,
        'aanmelder': aanmelder,
        'lastupdated': lastupdated,
      };
}
