class InstallmentCount {
  final int paid;
  final int total;

  InstallmentCount({required this.paid, required this.total});

  factory InstallmentCount.fromMap(Map<String, dynamic> map) =>
      InstallmentCount(
        paid: map['paid'] as int,
        total: map['total'] as int,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'paid': paid,
        'total': total,
      };
}
