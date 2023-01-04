class Words {
  late final List<String> list;

  Words(String str) {
    list = str.trim().split(' ');
  }
}

class OnlyNumbers {
  late final List<int> list;

  OnlyNumbers(Words words) {
    list = words.list.map((e) => int.tryParse(e)).whereType<int>().toList();
  }

  @override
  String toString() {
    return list.toString();
  }
}

typedef WordsStatsMap = Map<String, int>;

class WordsIncludingStats {
  WordsStatsMap stats = {};

  WordsIncludingStats(Words words) {
    for (var word in words.list) {
      stats[word] = (stats[word] ?? 0) + 1;
    }
  }

  @override
  String toString() {
    return stats.toString();
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

class NumbersSet {
  Set<int> set = {};

  NumbersSet(Words words) {
    for (var word in words.list) {
      if (_numbers.containsKey(word)) {
        set.add(_numbers[word]!);
      }
    }
  }

  @override
  String toString() {
    return set.toString();
  }
}
