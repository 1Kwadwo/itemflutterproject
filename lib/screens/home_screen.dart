import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../data/sample_expenses.dart';
import '../widgets/expense_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_chips.dart';
import '../widgets/expense_summary.dart';
import 'expense_detail_screen.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedCategory;

  List<Expense> get _filteredExpenses {
    List<Expense> expenses = SampleExpenses.expenses;

    // Sort by date (newest first)
    expenses.sort((a, b) => b.date.compareTo(a.date));

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      expenses = expenses
          .where((expense) =>
              expense.title
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              expense.description
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    // Filter by category
    if (_selectedCategory != null) {
      expenses = expenses
          .where((expense) => expense.category == _selectedCategory)
          .toList();
    }

    return expenses;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onSearchCleared() {
    setState(() {
      _searchQuery = '';
      _searchController.clear();
    });
  }

  void _onCategorySelected(String? category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _navigateToExpenseDetail(Expense expense) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpenseDetailScreen(
          expense: expense,
          onExpenseUpdated: (updatedExpense) {
            setState(() {
              SampleExpenses.updateExpense(updatedExpense);
            });
          },
          onExpenseDeleted: (expenseId) {
            setState(() {
              SampleExpenses.deleteExpense(expenseId);
            });
          },
        ),
      ),
    );
  }

  void _navigateToAddExpense() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddExpenseScreen(
          onExpenseAdded: (newExpense) {
            setState(() {
              SampleExpenses.addExpense(newExpense);
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredExpenses = _filteredExpenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses Tracker'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: Column(
        children: [
          // Financial Summary
          const ExpenseSummary(),

          // Search Bar
          CustomSearchBar(
            hintText: 'Search expenses...',
            value: _searchQuery,
            onChanged: _onSearchChanged,
            onClear: _onSearchCleared,
          ),

          // Category Filter Chips
          CategoryChips(
            categories: SampleExpenses.categories,
            selectedCategory: _selectedCategory,
            onCategorySelected: _onCategorySelected,
          ),

          // Expenses List
          Expanded(
            child: filteredExpenses.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No expenses found',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your search or filters',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[500],
                                  ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredExpenses.length,
                    itemBuilder: (context, index) {
                      final expense = filteredExpenses[index];
                      return ExpenseCard(
                        expense: expense,
                        onTap: () => _navigateToExpenseDetail(expense),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddExpense,
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
