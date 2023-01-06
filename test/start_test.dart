import 'package:collection/collection.dart';
import 'package:start/dec2byte.dart';
import 'package:start/math_lib.dart';
import 'package:start/words_collection.dart';
import 'package:test/test.dart';

void main() {
  test('math_lib', () {
    expect(GreatestCommonDivisor(15, 12).value, 3);
    expect(LeastCommonMultiple(15, 12).value, 60);

    expectListsIsEqual(PrimeFactorization(1).result, [1]);
    expectListsIsEqual(PrimeFactorization(2).result, [1, 2]);
    expectListsIsEqual(PrimeFactorization(3).result, [1, 3]);
    expectListsIsEqual(PrimeFactorization(5).result, [1, 5]);
    expectListsIsEqual(PrimeFactorization(7).result, [1, 7]);
    expectListsIsEqual(PrimeFactorization(12).result, [1, 2, 2, 3]);
    expectListsIsEqual(PrimeFactorization(15).result, [1, 3, 5]);

    expect(NthRoot(81, 4).value, 3.0);
    expect(NthRoot(81, 2).value, 9.0);
    expect(NthRoot(0, 2).value, 0.0);

    try {
      NthRoot(20, 0);
    } catch (e) {
      expect(e.toString(), 'Invalid argument(s): "n" must be greater 0');
    }
    try {
      NthRoot(-20, 2);
    } catch (e) {
      expect(e.toString(),
          'Invalid argument(s): "num" must be greater or equal 0');
    }
  });

  test('dec2byte', () {
    expect(DecimalSystem(158).toByte(), '10011110');
    expect(ByteSystem('10011110').toDecimal(), 158);
  });

  test('words_collection', () {
    expectListsIsEqual(
        OnlyNumbers(Words('Hi 1 test 2 yes 176')).list, [1, 2, 176]);

    var wordsIncludingStats = WordsIncludingStats(Words('hi test hi spam'));
    expect(wordsIncludingStats.stats['hi'], 2);
    expect(wordsIncludingStats.stats['test'], 1);
    expect(wordsIncludingStats.stats['spam'], 1);
    expect(wordsIncludingStats.stats['-'], null);

    var numbersSet = NumbersSet(Words('two hi one nine hi two zero zero'));
    expect(numbersSet.set.contains(0), true);
    expect(numbersSet.set.contains(1), true);
    expect(numbersSet.set.contains(2), true);
    expect(numbersSet.set.contains(3), false);
    expect(numbersSet.set.contains(4), false);
    expect(numbersSet.set.contains(5), false);
    expect(numbersSet.set.contains(6), false);
    expect(numbersSet.set.contains(7), false);
    expect(numbersSet.set.contains(8), false);
    expect(numbersSet.set.contains(9), true);
  });
}

void expectListsIsEqual<T>(List<T> actual, List<T> expected) {
  expect(ListEquality().equals(actual, expected), true);
}
