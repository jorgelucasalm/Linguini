class StateService {
  static final List<String> states = [
    "Ovo",
    "Alface",
    "Coentro",
    "Abacate",
    "Cenoura",
    "Chocolate",
    "Leite"
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
