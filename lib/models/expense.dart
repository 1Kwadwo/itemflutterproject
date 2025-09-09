class Expense {
  final int id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final String category;
  final String type; // 'income' or 'expense'

  const Expense({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Expense && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Expense{id: $id, title: $title, amount: $amount, category: $category, type: $type}';
  }
}
