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
                    isScrollControlled: true,
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
                    isScrollControlled: true,
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Add new transaction',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 64,
                  child: Spacer(),
                ),
                Icon(Icons.close)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    _isIncomeForm = true;
                  });
                },
                child: Text(
                  'Income',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _isIncomeForm
                        ? Colors.blue[900]
                        : Colors.grey, // Check _isIncomeForm value
                    decoration: _isIncomeForm
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationThickness: _isIncomeForm ? 3.0 : 0.0,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isIncomeForm = false;
                    });
                  },
                  child: Text(
                    'Expense',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: !_isIncomeForm
                          ? Colors.blue[900]
                          : Colors.grey, // Check !_isIncomeForm value
                      decoration: !_isIncomeForm
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationThickness: !_isIncomeForm ? 3.0 : 0.0,
                    ),
                  ))
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Income name'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: 'Property rent',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter name of Income';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 20),
            const Text('Select Account'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: 'FirstBank - 0022446688',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select Account';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 20),
            const Text('Transaction date'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: 'Date',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter date of transaction';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 20),
            const Text('Amount'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: '\$ 2000',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Amount';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const ExpenseSuccessfulBottomSheet();
                      })
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.blue[900],
                    minimumSize: const Size(10.0, 44.0)),
                child: const Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncomeSuccessfulBottomSheet extends StatelessWidget {
  const IncomeSuccessfulBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Successful',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.green),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your income has been successfully added to earnings',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Transaction name'),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            const Text('Select the Budget'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: 'Enter desired budget',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select Budget';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            const Text('Select the Category'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: 'Input Category',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select Category';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            const Text('Transaction date'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: 'Date',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter date of transaction';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            const Text('Amount'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                labelText: '\$ 00.00',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter amount';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const ExpenseSuccessfulBottomSheet();
                      })
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.blue[900],
                    minimumSize: const Size(10.0, 44.0)),
                child: const Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseSuccessfulBottomSheet extends StatelessWidget {
  const ExpenseSuccessfulBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Successful',
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w500, color: Colors.green),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('expense has been successfully added to transactions',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
