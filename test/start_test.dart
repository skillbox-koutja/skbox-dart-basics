import 'package:collection/collection.dart';
import 'package:start/dec2byte.dart';
import 'package:start/math_lib.dart';
import 'package:start/words_collection.dart';
import 'package:test/test.dart';

void main() {
  test('math_lib', () {
    expect(GreatestCommonDivisor.compute(15, 12), 3);
    expect(LeastCommonMultiple.compute(15, 12), 60);

    expectListsIsEqual(PrimeFactorization.find(1), [1]);
    expectListsIsEqual(PrimeFactorization.find(2), [1, 2]);
    expectListsIsEqual(PrimeFactorization.find(3), [1, 3]);
    expectListsIsEqual(PrimeFactorization.find(5), [1, 5]);
    expectListsIsEqual(PrimeFactorization.find(7), [1, 7]);
    expectListsIsEqual(PrimeFactorization.find(12), [1, 2, 2, 3]);
    expectListsIsEqual(PrimeFactorization.find(15), [1, 3, 5]);

    expect(NthRoot.compute(81, 4), 3.0);
    expect(NthRoot.compute(81, 2), 9.0);
    expect(NthRoot.compute(0, 2), 0.0);

    try {
      NthRoot.compute(20, 0);
    } catch (e) {
      expect(e.toString(), 'Invalid argument(s): "n" must be greater 0');
    }
    try {
      NthRoot.compute(-20, 2);
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
        OnlyNumbers.find(Words('Hi 1 test 2 yes 176')), [1, 2, 176]);

    var wordsIncludingStats =
        WordsIncludingStats.compute(Words('hi test hi spam'));
    expect(wordsIncludingStats['hi'], 2);
    expect(wordsIncludingStats['test'], 1);
    expect(wordsIncludingStats['spam'], 1);
    expect(wordsIncludingStats['-'], null);

    var numbersSet =
        OnlyUniqueNumbersSet.create(Words('two hi one nine hi two zero zero'));
    expect(numbersSet.contains(0), true);
    expect(numbersSet.contains(1), true);
    expect(numbersSet.contains(2), true);
    expect(numbersSet.contains(3), false);
    expect(numbersSet.contains(4), false);
    expect(numbersSet.contains(5), false);
    expect(numbersSet.contains(6), false);
    expect(numbersSet.contains(7), false);
    expect(numbersSet.contains(8), false);
    expect(numbersSet.contains(9), true);
  });
}

void expectListsIsEqual<T>(List<T> actual, List<T> expected) {
  expect(ListEquality().equals(actual, expected), true);
}
