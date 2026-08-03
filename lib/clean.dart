import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('❌ Please provide a module name (e.g., order or payment).');
    return;
  }

  final inputName = arguments[0].replaceAll('\\', '/');
  final segments = inputName.split('/');
  final baseName = segments.last;
  final className = _toPascalCase(baseName);

  // تعريف الهيكل الكامل (Clean Architecture)
  final structure = {
    // 1. Domain Layer (Pure Logic)
    '$inputName/domain/entities': () => _createFile(
        '$inputName/domain/entities/${baseName}_entity.dart',
        'class ${className}Entity {}',),
    '$inputName/domain/repositories': () => _createFile(
        '$inputName/domain/repositories/i${baseName}_repository.dart',
        'abstract class I${className}Repository {}',),
    '$inputName/domain/usecases': null,

    // 2. Data Layer (Implementation)
    '$inputName/data/models': () => _createFile(
        '$inputName/data/models/${baseName}_model.dart',
        "import '../../domain/entities/${baseName}_entity.dart';\n\nclass ${className}Model extends ${className}Entity {}",),
    '$inputName/data/datasources': () => _createFile(
        '$inputName/data/datasources/${baseName}_remote_datasource.dart',
        'class ${className}RemoteDataSource {}',),
    '$inputName/data/repositories': () => _createFile(
        '$inputName/data/repositories/${baseName}_repository_impl.dart',
        "import '../../domain/repositories/i${baseName}_repository.dart';\n\nclass ${className}RepositoryImpl implements I${className}Repository {}",),

    // 3. Presentation Layer (UI & Logic)
    '$inputName/presentation/bloc': () =>
        _generateBlocFiles(inputName, baseName, className),
    '$inputName/presentation/view/screens': () =>
        _generateScreenFile(inputName, baseName, className),
    '$inputName/presentation/view/widgets': null,
  };

  _buildStructure(structure);
}

void _buildStructure(Map<String, Function?> entrepreneurs) {
  entrepreneurs.forEach((path, fileCreator) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('✅ Created Directory: $path');
    }
    if (fileCreator != null) fileCreator();
  });
}

void _createFile(String path, String content) {
  final file = File(path);
  if (!file.existsSync()) {
    file.writeAsStringSync(content);
    print('📄 Created File: $path');
  }
}

void _generateBlocFiles(String path, String baseName, String className) {
  _createFile('$path/presentation/bloc/${baseName}_bloc.dart', '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i${baseName}_repository.dart';
part '${baseName}_event.dart';
part '${baseName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  final I${className}Repository repository;

  ${className}Bloc(this.repository) : super(${className}Initial()) {
    on<${className}Started>((event, emit) {
      // Logic here
    });
  }
}
''');
  _createFile('$path/presentation/bloc/${baseName}_event.dart',
      "part of '${baseName}_bloc.dart';\n\nabstract class ${className}Event {} \nclass ${className}Started extends ${className}Event {}",);
  _createFile('$path/presentation/bloc/${baseName}_state.dart',
      "part of '${baseName}_bloc.dart';\n\nabstract class ${className}State {}\nclass ${className}Initial extends ${className}State {}",);
}

void _generateScreenFile(String path, String baseName, String className) {
  _createFile('$path/presentation/view/screens/${baseName}_screen.dart', '''
import 'package:flutter/material.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$className')),
      body: const Center(child: Text('$className Screen')),
    );
  }
}
''');
}

String _toPascalCase(String text) => text
    .split(RegExp(r'[_\-]'))
    .map((w) => w[0].toUpperCase() + w.substring(1))
    .join();
