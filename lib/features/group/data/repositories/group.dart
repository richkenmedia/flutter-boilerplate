import 'dart:math';

import 'package:boilerplate/features/group/data/models/group.dart';

abstract class GroupRepository {
  /// Throws [NetworkException].
  Future<Group> fetchGroup(String name);
}

class FakeGroupRepository implements GroupRepository {
  @override
  Future<Group> fetchGroup(String name) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return Group(
          name: name,
          // Temperature between 20 and 35.99
          id: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}
