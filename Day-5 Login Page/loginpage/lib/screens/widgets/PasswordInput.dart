import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MakeInput extends StatefulWidget {
  String label;
  String hintText;
  bool ObscureText;
  bool isPassword = false;

  MakeInput(
      {super.key,
      required this.hintText,
      required this.label,
      required this.isPassword,
      this.ObscureText = false});

  @override
  State<MakeInput> createState() => _MakeInputState();
}

class _MakeInputState extends State<MakeInput> {
  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? _controller;
    return widget.isPassword
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.text,
                obscureText: widget.ObscureText,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: (() {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                        widget.ObscureText = !widget.ObscureText;
                        print(_controller);
                      });
                    }),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              const SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: widget.ObscureText,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
  }
}
