class Words {
  late final List<String> list;

  Words(String str) {
    list = str.trim().split(' ');
  }
}

class OnlyNumbers {
  static List<int> find(Words words) {
    return words.list.map((e) => int.tryParse(e)).whereType<int>().toList();
  }
}

typedef WordsStatsMap = Map<String, int>;

class WordsIncludingStats {
  static WordsStatsMap compute(Words words) {
    WordsStatsMap stats = {};
    for (var word in words.list) {
      stats[word] = (stats[word] ?? 0) + 1;
    }

    return stats;
  }
}

Map<String, int> _numbers = {
  'zero': 0,
  'one': 1,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9,
};

class OnlyUniqueNumbersSet {
  static Set<int> create(Words words) {
    Set<int> set = {};
    for (var word in words.list) {
      if (_numbers.containsKey(word)) {
        set.add(_numbers[word]!);
      }
    }
    return set;
  }
}
