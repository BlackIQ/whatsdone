class Setting {
  Setting({
    this.background,
    this.taskNameColor,
    this.taskNameFont,
    this.taskDateColor,
    this.taskDateFont,
  });

  final String background;
  final String taskNameColor;
  final int taskNameFont;
  final String taskDateColor;
  final int taskDateFont;


  factory Setting.fromMap(Map<String, dynamic> json) {
    return Setting(
      background: json['background'],
      taskNameColor: json['taskNameColor'],
      taskNameFont: json['taskNameFont'],
      taskDateColor: json['taskDateColor'],
      taskDateFont: json['taskDateFont'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'row': background,
      'name': taskNameColor,
      'id': taskNameFont,
      'date': taskDateColor,
      'status': taskDateFont,
    };
  }
}