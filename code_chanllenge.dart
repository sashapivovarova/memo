typedef Settings = Map<String, String>;

class Dictionary {
  final Settings word = {};

  void add(String term, String definition) {
    word[term] = definition;
  }

  String get(String term) {
    return word[term] ?? "$term was not found";
  }

  void delete(String term) {
    word.remove(term);
  }

  void update(String term, String definition) {
    if (word.containsKey(term)) {
      word[term] = definition;
    }
  }

  void showAll() {
    word.forEach((term, definition) {
      print(term);
    });
  }

  int count() {
    return word.length;
  }

  void upsert(String term, String definition) {
    word[term] = definition;
  }

  bool exists(String term) {
    return word.containsKey(term);
  }

  void bulkAdd(List<Settings> words) {
    for (var termData in words) {
      final term = termData['term'];
      final definition = termData['definition'];
      if (term != null && definition != null) {
        word[term] = definition;
      }
    }
  }

  void bulkDelete(List<String> words) {
    for (var term in words) {
      word.remove(term);
    }
  }
}

void main() {
  Dictionary myDictionary = Dictionary();
  myDictionary.add("nico", "flutter teacher.");

  print(myDictionary.get("nico"));

  myDictionary.update("nico", "good flutter teacher");

  print(myDictionary.get("nico"));

  myDictionary.delete("nico");

  print(myDictionary.count());

  myDictionary.upsert("nico", "flutter teacher");

  print(myDictionary.exists("nico"));

  myDictionary.bulkAdd([
    {"term": "eunsol", "definition": "student"},
    {"term": "jeju", "definition": "my home town"},
  ]);

  myDictionary.showAll();

  myDictionary.bulkDelete(["eunsol", "jeju"]);

  myDictionary.showAll();
}
