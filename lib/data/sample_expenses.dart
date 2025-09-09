import '../models/expense.dart';

class SampleExpenses {
  static List<Expense> expenses = [
    Expense(
      id: 1,
      title: 'Grocery Shopping',
      description: 'Weekly groceries from supermarket',
      amount: 85.50,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Food',
      type: 'expense',
    ),
    Expense(
      id: 2,
      title: 'Salary',
      description: 'Monthly salary payment',
      amount: 3500.00,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: 'Income',
      type: 'income',
    ),
    Expense(
      id: 3,
      title: 'Uber Ride',
      description: 'Ride to downtown',
      amount: 12.75,
      date: DateTime.now().subtract(const Duration(days: 3)),
      category: 'Transport',
      type: 'expense',
    ),
    Expense(
      id: 4,
      title: 'Netflix Subscription',
      description: 'Monthly streaming service',
      amount: 15.99,
      date: DateTime.now().subtract(const Duration(days: 4)),
      category: 'Entertainment',
      type: 'expense',
    ),
    Expense(
      id: 5,
      title: 'Electricity Bill',
      description: 'Monthly electricity bill',
      amount: 120.00,
      date: DateTime.now().subtract(const Duration(days: 5)),
      category: 'Bills',
      type: 'expense',
    ),
    Expense(
      id: 6,
      title: 'Coffee Shop',
      description: 'Morning coffee and pastry',
      amount: 8.50,
      date: DateTime.now().subtract(const Duration(days: 6)),
      category: 'Food',
      type: 'expense',
    ),
    Expense(
      id: 7,
      title: 'Freelance Work',
      description: 'Web development project payment',
      amount: 800.00,
      date: DateTime.now().subtract(const Duration(days: 7)),
      category: 'Income',
      type: 'income',
    ),
    Expense(
      id: 8,
      title: 'New Shoes',
      description: 'Running shoes from sports store',
      amount: 120.00,
      date: DateTime.now().subtract(const Duration(days: 8)),
      category: 'Shopping',
      type: 'expense',
    ),
    Expense(
      id: 9,
      title: 'Gas Station',
      description: 'Car fuel refill',
      amount: 45.00,
      date: DateTime.now().subtract(const Duration(days: 9)),
      category: 'Transport',
      type: 'expense',
    ),
    Expense(
      id: 10,
      title: 'Restaurant Dinner',
      description: 'Dinner with friends at Italian restaurant',
      amount: 65.00,
      date: DateTime.now().subtract(const Duration(days: 10)),
      category: 'Food',
      type: 'expense',
    ),
    Expense(
      id: 11,
      title: 'Phone Bill',
      description: 'Monthly mobile phone bill',
      amount: 55.00,
      date: DateTime.now().subtract(const Duration(days: 11)),
      category: 'Bills',
      type: 'expense',
    ),
    Expense(
      id: 12,
      title: 'Movie Tickets',
      description: 'Cinema tickets for weekend movie',
      amount: 24.00,
      date: DateTime.now().subtract(const Duration(days: 12)),
      category: 'Entertainment',
      type: 'expense',
    ),
    Expense(
      id: 13,
      title: 'Investment Return',
      description: 'Stock market investment return',
      amount: 150.00,
      date: DateTime.now().subtract(const Duration(days: 13)),
      category: 'Income',
      type: 'income',
    ),
    Expense(
      id: 14,
      title: 'Online Shopping',
      description: 'Books and electronics from Amazon',
      amount: 89.99,
      date: DateTime.now().subtract(const Duration(days: 14)),
      category: 'Shopping',
      type: 'expense',
    ),
    Expense(
      id: 15,
      title: 'Gym Membership',
      description: 'Monthly gym membership fee',
      amount: 49.99,
      date: DateTime.now().subtract(const Duration(days: 15)),
      category: 'Health',
      type: 'expense',
    ),
  ];

  static List<String> get categories {
    return expenses.map((expense) => expense.category).toSet().toList()..sort();
  }

  static double get totalIncome {
    return expenses
        .where((expense) => expense.type == 'income')
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  static double get totalExpenses {
    return expenses
        .where((expense) => expense.type == 'expense')
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  static double get balance {
    return totalIncome - totalExpenses;
  }

  static void updateExpense(Expense updatedExpense) {
    final index =
        expenses.indexWhere((expense) => expense.id == updatedExpense.id);
    if (index != -1) {
      expenses[index] = updatedExpense;
    }
  }

  static void deleteExpense(int expenseId) {
    expenses.removeWhere((expense) => expense.id == expenseId);
  }

  static void addExpense(Expense newExpense) {
    expenses.add(newExpense);
  }
}
