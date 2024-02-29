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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Add new transaction',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 84,
                  child: Spacer(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
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
                child: Stack(
                  children: [
                    Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _isIncomeForm
                            ? const Color(0xFF1F1BF2)
                            : Colors.grey,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom:
                          -2, // Adjust this value to change the distance between text and underline
                      child: Container(
                        height:
                            4, // Adjust this value to change the thickness of the underline
                        decoration: BoxDecoration(
                          color: _isIncomeForm
                              ? const Color(0xFF1F1BF2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                              5.0), // Adjust this value to control the roundness of edges
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isIncomeForm = false;
                  });
                },
                child: Stack(
                  children: [
                    Text(
                      'Expense',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: !_isIncomeForm
                            ? const Color(0xFF1F1BF2)
                            : Colors.grey,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom:
                          -2, // Adjust this value to change the distance between text and underline
                      child: Container(
                        height:
                            4, // Adjust this value to change the thickness of the underline
                        decoration: BoxDecoration(
                          color: !_isIncomeForm
                              ? const Color(0xFF1F1BF2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                              5.0), // Adjust this value to control the roundness of edges
                        ),
                      ),
                    ),
                  ],
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
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey,
                ),
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
                        return const IncomeSuccessfulBottomSheet();
                      })
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color(0xFF1F1BF2),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 21, right: 21, bottom: 64),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Icon(
                Icons.check_circle_outline,
                size: 64,
                color: Color(0xFF009517),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Successful',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF009517),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                        textAlign: TextAlign.center,
                        'Your income has been successfully added to earnings',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12.0), // Rounded border outline
                border: Border.all(
                    color: const Color(0xFF7FA9DA)), // Border outline color
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[350],
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: const Icon(
                                Icons.maps_home_work_outlined,
                                size: 32,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Property rent',
                              style: TextStyle(
                                color: Color(0xFF0C0C0C),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Text(
                              'Nov 18',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      Text('\$2000')
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  // Close the bottom sheet
                  Navigator.of(context).pop()
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color(0xFF1F1BF2),
                    minimumSize: const Size(10.0, 44.0)),
                child: const Text(
                  'Done',
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
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey,
                ),
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
                    backgroundColor: const Color(0xFF1F1BF2),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 21, right: 21, bottom: 64),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Icon(
                Icons.check_circle_outline,
                size: 64,
                color: Color(0xFF009517),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Successful',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF009517),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                      textAlign: TextAlign.center,
                      'Your expense has been successfully added to transactions',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12.0), // Rounded border outline
                border: Border.all(
                    color: const Color(0xFF7FA9DA)), // Border outline color
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[350],
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 32,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Walmart',
                              style: TextStyle(
                                color: Color(0xFF0C0C0C),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Text(
                              'Nov 10',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      Text('\$100')
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  // Close the bottom sheet
                  Navigator.of(context).pop()
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color(0xFF1F1BF2),
                    minimumSize: const Size(10.0, 44.0)),
                child: const Text(
                  'Done',
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
