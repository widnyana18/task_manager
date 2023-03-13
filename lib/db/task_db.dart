class Task {
  final String? desc;
  bool _isChecked;
  Task(this._isChecked, {this.desc});

  bool get isChecked => _isChecked;
  set isChecked(bool newValue) {
    _isChecked = newValue;
  }
}

List<Task> initData = <Task>[
  Task(false,
      desc:
          'Research & kumpulkan referensi utk solusi dri problem pd feature.'),
  Task(false,
      desc:
          'Mulai persiapkan & pelajari semua widget dn buatkan struktur projectny.'),
  Task(false,
      desc:
          'Mulai buatkan design layout, widget uiny & routeny yg sudh ad sesuai dgn sample.'),
  Task(false, desc: 'Buatkan interaction designny dlm state management.'),
  Task(false, desc: 'Buat simple animation designny'),
  Task(false, desc: 'Tingkatkan design ui lebih custom (optional).'),
];
