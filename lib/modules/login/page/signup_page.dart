import 'package:flutter/material.dart';
import 'package:nordic_ecommerce/res/common_widget/CircleBorderButton.dart';
import 'package:nordic_ecommerce/res/sizes.dart';

class SignupPage extends StatelessWidget {
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _fullname = '';
    String _password = '';
    String _phonenumber = '';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.homeItemPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                label: 'Email *',
                hint: 'Enter email',
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Full name *',
                hint: 'Enter full name',
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  _fullname = value;
                },
              ),
              SizedBox(height: 20),
              CustomSecureTextField(
                label: 'Password *',
                hint: 'Enter password',
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Phone number *',
                hint: 'Enter phone number',
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _phonenumber = value;
                },
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate() == false) {
                    //   return;
                    // }
                    print('$_email, $_fullname, $_password, $_phonenumber');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Login with:',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleImageButton(
                  image: NetworkImage(
                      'https://www.ecoblader.com/wp-content/uploads/2013/02/ecoblader-facebook.jpg'),
                  onTap: () {
                    print('onTap: Facebook');
                  },
                ),
                SizedBox(width: 20),
                CircleImageButton(
                  image: NetworkImage(
                      'https://banner2.cleanpng.com/20180610/jeu/kisspng-google-logo-google-search-google-now-5b1dacc1ad0462.3234288415286714257087.jpg'),
                  borderColor: Colors.grey,
                  onTap: () {
                    print('onTap: Google');
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? userHelper;

  final InputBorder? border;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? labelStyle;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  //input text style
  final TextStyle? style;

  CustomTextField(
      {Key? key,
      this.label,
      this.hint,
      this.userHelper,
      this.border,
      this.filled,
      this.fillColor,
      this.labelStyle,
      this.validator,
      this.style,
      this.onFieldSubmitted,
      this.textInputAction,
      this.focusNode,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.label ?? '', style: labelStyle),
        TextFormField(
          // controller: _userController,
          validator: this.validator,
          textInputAction: this.textInputAction,
          focusNode: this.focusNode,
          onFieldSubmitted: this.onFieldSubmitted,
          onChanged: this.onChanged,
          style: this.style,
          decoration: InputDecoration(
              border: this.border,
              focusedBorder: this.border,
              labelText: null,
              hintText: this.hint),
        ),
      ],
    );
  }
}

class CustomSecureTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? helper;

  final InputBorder? border;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? labelStyle;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  //input text style
  final TextStyle? style;

  const CustomSecureTextField(
      {Key? key,
      this.label,
      this.hint,
      this.helper,
      this.border,
      this.filled,
      this.fillColor,
      this.labelStyle,
      this.validator,
      this.style,
      this.textInputAction,
      this.focusNode,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key);
  @override
  _CustomSecureTextFieldState createState() => _CustomSecureTextFieldState();
}

class _CustomSecureTextFieldState extends State<CustomSecureTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label ?? '', style: widget.labelStyle),
        TextFormField(
          // controller: _passwordController,
          focusNode: widget.focusNode,
          obscureText: _obscureText,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          style: widget.style,
          decoration: InputDecoration(
            border: widget.border,
            focusedBorder: widget.border,
            fillColor: widget.fillColor,
            filled: widget.filled,
            hintText: widget.hint,
            labelText: null,
            helperText: widget.helper,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: widget.labelStyle?.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
