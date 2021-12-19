class Tasks {
  Tasks({
    this.row,
    this.name,
    this.id,
    this.status,
    this.date,
  });

  final int row;
  final String name;
  final int id;
  final String status;
  final String date;

  factory Tasks.fromMap(Map<String, dynamic> json) {
    return Tasks(
      row: json['row'],
      name: json['name'],
      id: json['id'],
      status: json['status'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'row': row,
      'name': name,
      'id': id,
      'date': date,
    };
  }
}