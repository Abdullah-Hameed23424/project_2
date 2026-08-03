import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('❌ Please provide a base folder name.');
    return;
  }

  final inputName = arguments[0].replaceAll('\\', '/'); // cross-platform
  final segments = inputName.split('/');
  final baseName = segments.last; // e.g., "chat"
  final className = _toPascalCase(baseName); // e.g., "Chat"

  final structure = {
    '$inputName/view/screens': () {
      final file = File('$inputName/view/screens/${baseName}_screen.dart');
      if (!file.existsSync()) {
        file.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/${baseName}_bloc.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ${className}Bloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('$className Screen')),
        body: BlocBuilder<${className}Bloc, ${className}State>(
          builder: (context, state) {
            if (state is ${className}Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ${className}Loaded) {
              return const Center(child: Text('Data Loaded ✅'));
            } else if (state is ${className}Error) {
              return Center(child: Text('Error: \${state.message}'));
            }
            return const Center(child: Text('Idle State'));
          },
        ),
      ),
    );
  }
}
''');
        print('📄 Created: ${file.path}');
      }
    },
    '$inputName/view/widgets': null,
    '$inputName/models': null,
    '$inputName/bloc': () {
      final blocFile = File('$inputName/bloc/${baseName}_bloc.dart');
      final eventFile = File('$inputName/bloc/${baseName}_event.dart');
      final stateFile = File('$inputName/bloc/${baseName}_state.dart');

      // Bloc file
      if (!blocFile.existsSync()) {
        blocFile.writeAsStringSync('''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part '${baseName}_event.dart';
part '${baseName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  ${className}Bloc() : super(${className}Initial()) {
    on<${className}Started>(_onStarted);
  }

  void _onStarted(${className}Started event, Emitter<${className}State> emit) async {
    emit(${className}Loading());
    try {
      // TODO: implement logic
      await Future.delayed(const Duration(seconds: 1));
      emit(${className}Loaded());
    } catch (e) {
      emit(${className}Error(message: e.toString()));
    }
  }
}
''');
        print('📄 Created: ${blocFile.path}');
      }

      // Event file
      if (!eventFile.existsSync()) {
        eventFile.writeAsStringSync('''
part of '${baseName}_bloc.dart';

@immutable
sealed class ${className}Event {}

final class ${className}Started extends ${className}Event {}
''');
        print('📄 Created: ${eventFile.path}');
      }

      // State file
      if (!stateFile.existsSync()) {
        stateFile.writeAsStringSync('''
part of '${baseName}_bloc.dart';

@immutable
sealed class ${className}State {}

final class ${className}Initial extends ${className}State {}

final class ${className}Loading extends ${className}State {}

final class ${className}Loaded extends ${className}State {}

final class ${className}Error extends ${className}State {
  final String message;
  ${className}Error({required this.message});
}
''');
        print('📄 Created: ${stateFile.path}');
      }
    },
  };

  structure.forEach((path, fileCreator) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('✅ Created: $path');
    } else {
      print('⚠️ Already exists: $path');
    }

    if (fileCreator != null) {
      fileCreator();
    }
  });
}

/// Converts snake_case or kebab-case to PascalCase
String _toPascalCase(String text) {
  return text
      .split(RegExp(r'[_\-]'))
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join();
}
