import 'package:meta/meta.dart';

class Group {
  final String name;
  final double id;

  Group({
    @required this.name,
    @required this.id,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Group && o.name == name && o.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
