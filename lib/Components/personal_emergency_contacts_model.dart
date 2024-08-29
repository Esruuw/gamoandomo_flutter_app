class PersonalEmergency {
  int? id;  // Make id nullable
  String name;
  String contactNo;

  PersonalEmergency(this.name, this.contactNo);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'name': name, 'contactNo': contactNo};
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  PersonalEmergency.fromMap(Map<String, dynamic> map)  // Use <String, dynamic> instead of <dynamic, dynamic>
      : id = map['id'],
        name = map['name'],
        contactNo = map['contactNo'];
}
