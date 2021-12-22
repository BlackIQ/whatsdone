class Task {
  Task({
    this.row,
    this.name,
    this.id,
    this.status,
    this.date,
    this.note,
  });

  final int row;
  final String name;
  final int id;
  final String status;
  final String date;
  final String note;

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      row: json['row'],
      name: json['name'],
      id: json['id'],
      status: json['status'],
      date: json['date'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'row': row,
      'name': name,
      'id': id,
      'date': date,
      'status': status,
      'note': note,
    };
  }
}