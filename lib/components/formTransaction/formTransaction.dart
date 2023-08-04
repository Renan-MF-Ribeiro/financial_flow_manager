import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormTransaction extends StatefulWidget {
  final void Function(String title, double value, DateTime? data) onSubmit;

  FormTransaction(this.onSubmit, {super.key});

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = null;
  bool valueFocus = false;
  bool titleFocus = true;

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty) {
      setState(() {
        titleFocus = true;
      });
      return;
    } else if (value == 0.0) {
      setState(() {
        valueFocus = true;
      });
      print(value);
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then(
      (value) {
        if (value == null) {
          return;
        }
        setState(() {
          _selectedDate = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: _titleController,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(labelText: 'Titulo'),
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: _valueController,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
            autofocus: valueFocus,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Data selecionada: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary),
                  onPressed: _showDatePicker,
                  child: Text(
                    'Selecione uma data',
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Nova Transação'),
              )
            ],
          )
        ]),
      ),
    );
  }
}
