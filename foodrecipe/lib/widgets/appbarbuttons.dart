import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const TransactionBottomSheet();
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
            child: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const TransactionBottomSheet();
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionBottomSheet extends StatefulWidget {
  const TransactionBottomSheet({super.key});

  @override
  State<TransactionBottomSheet> createState() => _TransactionBottomSheetState();
}

class _TransactionBottomSheetState extends State<TransactionBottomSheet> {
  bool _isIncomeForm = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Add new transaction',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    _isIncomeForm = true;
                  });
                },
                child: const Text(
                  'Income',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isIncomeForm = false;
                  });
                },
                child: const Text(
                  'Expense',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              )
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isIncomeForm
                ? IncomeForm(
                    key: const ValueKey(true),
                    onSwitchForm: () {
                      setState(() {
                        _isIncomeForm = false;
                      });
                    },
                  )
                : ExpenseForm(
                    key: const ValueKey(false),
                    onSwitchForm: () {
                      setState(() {
                        _isIncomeForm = true;
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class IncomeForm extends StatelessWidget {
  const IncomeForm({super.key, required this.onSwitchForm});
  final VoidCallback onSwitchForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: <Widget>[
          Text(
            'Income Form',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Add your income form fields here
        ],
      ),
    );
  }
}

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key, required this.onSwitchForm});
  final VoidCallback onSwitchForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: <Widget>[
          Text(
            'Expense Form',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Add your expenses form fields here
        ],
      ),
    );
  }
}
