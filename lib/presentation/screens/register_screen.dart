import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => username = value,
            prefixIcon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'El nombre de usuario es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: (value) => email = value,
            prefixIcon: Icons.email_outlined,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'El nombre de usuario es requerido';
              }
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) {
                return 'El correo electronico no es valido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            onChanged: (value) => password = value,
            prefixIcon: Icons.password,
            obscureText: true,
            // suffixIcon: GestureDetector(
            //   onTap: () {},
            //   child: const Icon(Icons.remove_red_eye),
            // ),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'El nombre de usuario es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState?.validate() ?? false;
              if (!isValid) return;

              logger.d('username: $username');
              logger.d('email: $email');
              logger.d('password: $password');
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
