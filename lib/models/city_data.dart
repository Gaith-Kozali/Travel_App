import 'package:faker/faker.dart';

class CityData {
  static Faker faker = Faker();
  static List<String> cities =
      List.generate(100, (index) => faker.address.city());
  static List<String> getSuggestion(String query) =>
      List.of(cities).where((element) {
        final cityLower = element.toLowerCase();
        final queryLower = query.toLowerCase();
        return cityLower.contains(queryLower);
      }).toList();
}
