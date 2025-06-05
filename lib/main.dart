import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  String? username;
  String? phonenumber;
  String? email;
  String? password;

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    usernameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Register",
            style: TextStyle(
                color: Color.fromARGB(255, 54, 85, 88),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  focusNode: usernameFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(emailFocus);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Username must not be empty";
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "User name",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Color.fromARGB(255, 43, 73, 77),
                    filled: true,
                    fillColor: Color.fromARGB(255, 80, 136, 133),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  focusNode: emailFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Email must not be empty";
                    else if (RegExp(r'[\u0600-\u06FF]').hasMatch(value))
                      return "Arabic letters are not allowed";
                    else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                        .hasMatch(value))
                      return "Invalid email format";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Color.fromARGB(255, 43, 73, 77),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 80, 136, 133),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  focusNode: passwordFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(confirmPasswordFocus);
                  },
                  obscureText: _obscurePassword,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must not be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    suffixIconColor: Colors.white,
                    prefixIconColor: Color.fromARGB(255, 43, 73, 77),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 80, 136, 133),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  focusNode: confirmPasswordFocus,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    // يمكنك تنفيذ أمر نهائي هنا مثل الفحص أو الحفظ
                    if (formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data…')));
                    }
                  },
                  obscureText: _obscureConfirm,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password must not be empty";
                    }
                    if (value != password) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirm = !_obscureConfirm;
                        });
                      },
                    ),
                    suffixIconColor: Colors.white,
                    prefixIconColor: Color.fromARGB(255, 43, 73, 77),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 80, 136, 133),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  // مسافة قبل اCenter(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data…')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(color: Color.fromARGB(255, 54, 85, 88)),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      elevation: 9,
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color.fromARGB(255, 54, 85, 88),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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

class __MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  String? email;
  String? password;

  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 43, 73, 77),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.amber, offset: Offset(3, 3)),
                        BoxShadow(color: Colors.amber, offset: Offset(-3, -3)),
                      ]),
                  width: 110,
                  height: 110,
                  alignment: Alignment.center,
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    " WELCOME \n \n we are excited to have you back ,can not wait to see what you have been up to since you last logged in",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  focusNode: emailFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Email must not be empty";
                    else if (RegExp(r'[\u0600-\u06FF]').hasMatch(value))
                      return "Arabic letters are not allowed";
                    else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                        .hasMatch(value))
                      return "Invalid email format";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "EMAIL",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 224, 218, 218)),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Color.fromARGB(255, 43, 73, 77),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 71, 112, 110),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText:
                      _obscurePassword, // ← هذا يجعل النص مخفياً أو ظاهراً
                  focusNode: passwordFocus,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must not be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "PASSWORD",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 224, 218, 218)),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                              !_obscurePassword; // ← تغيير الحالة عند الضغط
                        });
                      },
                    ),
                    suffixIconColor: Colors.white,
                    prefixIconColor: Color.fromARGB(255, 43, 73, 77),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 71, 112, 110),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // تنفيذ نسيان كلمة المرور
                    },
                    child: Text(
                      'Forgot Password?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 71, 112, 110)),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data...')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF365558),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 40),
                      elevation: 9,
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                      ),
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
    
  // This widget is the root of your application.


