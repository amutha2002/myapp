import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Amutha Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _textWidget(),
            _sizedBoxWidget(),
            _iconWidget(),
            _sizedBoxWidget(),
            _imageFromAsset(),
            _sizedBoxWidget(),
            _imageFromInternet(),
            _sizedBoxWidget(),
            _circleAvatarWidget(),
            _sizedBoxWidget(),
            _textFieldWidget(),
            _sizedBoxWidget(),
            _buttonWidget(),
            _sizedBoxWidget(),
            _textFormFieldWidget(),
            _sizedBoxWidget(),
            _dropDownButtonWidget(),
            _sizedBoxWidget(),
            _switchWidget(),
            _sizedBoxWidget(),
            _checkBoxWidget(),
            _sizedBoxWidget(),
            _radioButtonWidget(),
            _sizedBoxWidget(),
            _linearProgressIndicatorWidget(),
            _sizedBoxWidget(),
            _circularProgressIndicatorWidget(),
            _sizedBoxWidget(),
            _dividerWidget(),
            _sizedBoxWidget(),
            _sliderWidget(),
            _sizedBoxWidget(),
            _snackBarWidget(),
            _sizedBoxWidget(),
            _dividerWidget(),
            _sizedBoxWidget(),
            _dividerWidget(),
          ],
        ),
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: Colors.black87,
      leading: const Icon(Icons.face),
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(child: Text('About')),
            const PopupMenuItem(child: Text('Contact')),
          ];
        })
      ],
    );
  }

  Widget _sizedBoxWidget() {
    return const SizedBox(
      height: 50,
    );
  }

  Widget _textWidget() {
    return const Text(
      "Hello welcome",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black87,
          fontSize: 32.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline),
    );
  }

  Widget _iconWidget() {
    return Icon(
      Icons.image,
      size: 64.0,
      color: Theme.of(context).primaryColorDark,
    );
  }

  Widget _imageFromAsset() {
    // Image.asset('images/flower_1.jpeg');
    return const Image(
      image: AssetImage('images/flower_1.jpeg'),
      height: 100,
      width: 250,
    );
  }

  Widget _imageFromInternet() {
    return const Image(
        height: 100,
        width: 100,
        image: NetworkImage("https://picsum.photos/200/300"));
  }

  Widget _circleAvatarWidget() {
    return const CircleAvatar(
      radius: 70,
      backgroundImage: NetworkImage("https://picsum.photos/200/300"),
    );
  }

  Widget _buttonWidget() {
    return ElevatedButton(onPressed: () {}, child: const Text("Click me amu"));
  }

  Widget _textFieldWidget() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: const InputDecoration(
          icon: Icon(Icons.attach_money),
          label: Text('Enter price value'),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)))),
    );
  }

  String _email = "";
  Widget _textFormFieldWidget() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        label: Text('E-mail'),
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
        filled: true,
      ),
      onSaved: (String? emailVal) {
        this._email = emailVal!;
      },
    );
  }

  static const genderItems = <String>["Male", "Female", "Transgender"];

  final List<DropdownMenuItem<String>> _genderDropDownMenuItems = genderItems
      .map((String gender) =>
          DropdownMenuItem<String>(value: gender, child: Text(gender)))
      .toList();

  String _selectedGender = 'Female';
  Widget _dropDownButtonWidget() {
    return DropdownButton(
      value: _selectedGender,
      items: _genderDropDownMenuItems,
      onChanged: (String? newValue) {
        setState(() {
          _selectedGender = newValue ?? "Female";
        });
      },
    );
  }

  bool _swithState = false;
  Widget _switchWidget() {
    return Switch(
        value: this._swithState,
        onChanged: (bool newValue) {
          setState(() {
            this._swithState = newValue;
          });
        });
  }

  bool _checkBoxState = false;
  Widget _checkBoxWidget() {
    return Checkbox(
        value: this._checkBoxState,
        onChanged: (bool? newValue) {
          setState(() {
            this._checkBoxState = newValue ?? false;
          });
        });
  }

  int _radioValue = 0;
  Widget _radioButtonWidget() {
    return Row(
      children: [0, 1, 2, 3, 4]
          .map((int e) => Radio<int>(
                value: e,
                groupValue: this._radioValue,
                onChanged: (int? newValue) {
                  setState(() {
                    this._radioValue = newValue ?? 0;
                  });
                },
              ))
          .toList(),
    );
  }

  Widget _linearProgressIndicatorWidget() {
    return const LinearProgressIndicator();
  }

  Widget _circularProgressIndicatorWidget() {
    return const CircularProgressIndicator();
  }

  Widget _dividerWidget() {
    // return VerticalDivider();
    return const Divider();
  }

  double _sliderVal = 0.0;
  Widget _sliderWidget() {
    return Slider(
      value: _sliderVal,
      min: 0.0,
      max: 10.0,
      divisions: 5,
      label: '${_sliderVal.round()}',
      onChanged: (double newValue) {
        setState(() => _sliderVal = newValue);
      },
    );
  }

  Widget _snackBarWidget() {
    return ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("Hi, Amutha"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("Open SnackBar"));
  }

  // Not work in scroll view
  Widget _gridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5),
          child: const Text("He'd have you all unravel at the"),
          color: Colors.black87,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const Text('Heed not the rabble'),
          color: Colors.black87,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const Text('Sound of screams but the'),
          color: Colors.black87,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const Text('Who scream'),
          color: Colors.black87,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const Text('Revolution is coming...'),
          color: Colors.black87,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const Text('Revolution, they...'),
          color: Colors.black87,
        ),
      ],
    );
  }
}
