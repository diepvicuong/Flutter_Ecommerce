import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nordic_ecommerce/modules/login/page/signup_page.dart';
import 'package:nordic_ecommerce/res/sizes.dart';
import 'package:nordic_ecommerce/res/styles.dart';

typedef LoginValueCallback = void Function(String, String);

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.homeItemPadding),
          child: Column(
            children: [
              LoginForm(
                userLabel: 'Email *',
                userHint: 'Enter email',
                passwordLabel: 'Password *',
                passwordHint: 'Enter password',
                labelStyle: TextStyle(color: Colors.grey[600]),
                loginColor: Colors.amber,
                loginChild: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                loginRadius: 10,
                loginOnTap: (emailStr, passwordStr) {
                  if (emailStr.isNotEmpty && passwordStr.isNotEmpty) {
                    //call api login
                    print('$emailStr: $passwordStr');
                  }
                },
                userValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                passwordValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot password?')),
              SizedBox(height: 40),
              Text('Login with:'),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://www.ecoblader.com/wp-content/uploads/2013/02/ecoblader-facebook.jpg'),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://banner2.cleanpng.com/20180610/jeu/kisspng-google-logo-google-search-google-now-5b1dacc1ad0462.3234288415286714257087.jpg'),
                  ),
                )
              ]),
              // Spacer(),
              SizedBox(height: 20),

              RichText(
                text: TextSpan(
                  text: "Don't have account? ",
                  style: AppStyle.textStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: Colors.amber),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Navigate to signup page
                            print('Navigate to signup page');
                            Get.to(SignupPage());
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final String? userLabel;
  final String? userHint;
  final String? userHelper;
  final String? passwordLabel;
  final String? passwordHint;
  final String? passwordHelper;

  final InputBorder? border;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? labelStyle;

  final FormFieldValidator<String>? userValidator;
  final FormFieldValidator<String>? passwordValidator;

  //input text style
  final TextStyle? style;

  final double? loginHeight;
  final Color? loginColor;
  final Widget? loginChild;
  final double? loginRadius;
  final LoginValueCallback? loginOnTap;
  const LoginForm(
      {Key? key,
      this.userLabel,
      this.userHint,
      this.userHelper,
      this.passwordLabel,
      this.passwordHint,
      this.passwordHelper,
      this.border,
      this.filled,
      this.fillColor,
      this.style,
      this.userValidator,
      this.passwordValidator,
      this.loginColor,
      this.loginChild,
      this.loginRadius,
      this.loginOnTap,
      this.loginHeight,
      this.labelStyle})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late TextEditingController _userController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _userController,
            validator: widget.userValidator,
            textInputAction: TextInputAction.next,
            // onFieldSubmitted: (_) {
            //   FocusScope.of(context).requestFocus(focus);
            // },
            style: widget.style,
            decoration: InputDecoration(
                border: widget.border,
                focusedBorder: widget.border,
                fillColor: widget.fillColor,
                filled: widget.filled,
                labelText: widget.userLabel,
                labelStyle: widget.labelStyle,
                hintText: widget.userHint),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            validator: widget.passwordValidator,
            textInputAction: TextInputAction.done,
            style: widget.style,
            decoration: InputDecoration(
              border: widget.border,
              focusedBorder: widget.border,
              fillColor: widget.fillColor,
              filled: widget.filled,
              hintText: widget.passwordHint,
              labelText: widget.passwordLabel,
              labelStyle: widget.labelStyle,
              helperText: widget.passwordHelper,
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
          SizedBox(height: 40),
          SizedBox(
            height: widget.loginHeight ?? 40,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() == false) {
                  return;
                }
                if (widget.loginOnTap != null)
                  widget.loginOnTap!(
                      _userController.text, _passwordController.text);
              },
              child: widget.loginChild,
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: widget.loginColor ?? Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(widget.loginRadius ?? 0))),
            ),
          ),
        ],
      ),
    );
  }
}
