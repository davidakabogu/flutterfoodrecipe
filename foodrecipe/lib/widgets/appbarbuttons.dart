// ignore_for_file: avoid_print

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

class IncomeForm extends StatefulWidget {
  const IncomeForm({super.key, required this.onSwitchForm});
  final VoidCallback onSwitchForm;

  @override
  State<IncomeForm> createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Income name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter name of Income';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Select Account'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Bank';
                }
                return null;
              },
              onSaved: (value) {
                _username = value!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Transaction date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter the date';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // onPressed: _submitForm,
              onPressed: () => {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const IncomeSuccessfulBottomSheet();
                    })
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Do something with the form data, like sending it to a server
      print('Name: $_name');
      print('Username: $_username');
      print('Password: $_password');
    }
  }
}

class IncomeSuccessfulBottomSheet extends StatelessWidget {
  const IncomeSuccessfulBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Icon(Icons.check_circle),
        ),
        SizedBox(height: 20),
        Text(
          'Successful',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your income has been successfully added to earnings',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        )
      ],
    );
  }
}

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onSwitchForm});
  final VoidCallback onSwitchForm;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Transaction name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Select Category'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Icon';
                }
                return null;
              },
              onSaved: (value) {
                _username = value!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Transaction date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter the date';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // onPressed: _submitForm,
              onPressed: () => {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const ExpenseSuccessfulBottomSheet();
                    })
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Do something with the form data, like sending it to a server
      print('Name: $_name');
      print('Username: $_username');
      print('Password: $_password');
    }
  }
}

class ExpenseSuccessfulBottomSheet extends StatelessWidget {
  const ExpenseSuccessfulBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Icon(Icons.check_circle),
        ),
        SizedBox(height: 20),
        Text(
          'Successful',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('expense has been successfully added to transactions',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        )
      ],
    );
  }
}
