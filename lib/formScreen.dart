import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  Gender? _gender;
  var _agreement = false;
  String? _petName;
  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _petBreed;
  bool _valueOne = false;
  bool _valueTwo = false;
  bool _valueThree = false;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget buildPetNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Кличка питомца: '),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Пожалуйста введите кличку питомца';
        }
      },
      onSaved: (value) {
        _petName = value;
      },
    );
  }

  Widget buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Имя владельца: '),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) return 'Пожалуйста введите имя';
      },
      onSaved: (value) {
        _name = value;
      },
    );
  }

  Widget buildPhoneNumberField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Телефон: '),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) return 'Пожалуйста введите телефон';
      },
      onSaved: (value) {
        _phoneNumber = value;
      },
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'E-mail: '),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) return 'Пожалуйста введите E-mail';
        if (!value.contains('@')) return 'Это не E-mail';
      },
      onSaved: (value) {
        _email = value;
      },
    );
  }

  Widget buildPetBreedField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Порода питомца: '),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) return 'Пожалуйста введите породу питомца';
      },
      onSaved: (value) {
        _petBreed = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SizedBox(
          height: double.infinity,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                buildPetNameField(),
                buildNameField(),
                buildPhoneNumberField(),
                buildEmailField(),
                buildPetBreedField(),
                const SizedBox(height: 20.0),
                const Text(
                  'Чем питается:',
                ),
                CheckboxListTile(
                  title: const Text(' натуральный корм'),
                  autofocus: false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  selected: _valueOne,
                  value: _valueOne,
                  onChanged: (value) {
                    setState(() {
                      _valueOne = value as bool;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('влажный корм'),
                  autofocus: false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  selected: _valueTwo,
                  value: _valueTwo,
                  onChanged: (value) {
                    setState(() {
                      _valueTwo = value as bool;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('сухой корм'),
                  autofocus: false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  selected: _valueThree,
                  value: _valueThree,
                  onChanged: (value) {
                    setState(() {
                      _valueThree = value as bool;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Пол питомца:',
                ),
                RadioListTile(
                  title: const Text('Самец'),
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      if (value != null) _gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Самка'),
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      if (value != null) _gender = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Color color = Colors.red;
                      String text;

                      if (_gender == null) {
                        text = 'Выберите пол';
                      } else {
                        text = 'Форма успешно заполнена';
                        color = Colors.green;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(text),
                          backgroundColor: color,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female }
