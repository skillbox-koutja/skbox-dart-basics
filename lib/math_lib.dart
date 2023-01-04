import 'package:start/swap.dart';

// НОД. наибольший общий делитель.
class GreatestCommonDivisor {
  late final int value;

  GreatestCommonDivisor(int a, int b) {
    var arr = [a, b];
    if (a < b) {
      swap(arr, 0, 1);
    }

    while (arr[1] > 0) {
      arr[0] %= arr[1];
      swap(arr, 0, 1);
    }

    value = arr[0];
  }
}

// НОК. наименьшее общее кратное.
class LeastCommonMultiple {
  late final int value;

  LeastCommonMultiple(int a, int b) {
    var x = a ~/ GreatestCommonDivisor(a, b).value;

    value = x * b; //используя форму a * b / gcd(a, b),
    //можно получить переполнение на этапе a * b,
    //поэтому следует выполнять деление до умножения
  }
}

class PrimeFactorization {
  late final List<int> result;

  PrimeFactorization(int n) {
    if (n <= 1) {
      result = [n];
      return;
    }

    var primeNumbers = PrimeNumbers(n);

    result = [primeNumbers.next()];
    var div = primeNumbers.next();
    while (n > 1) {
      while (n % div == 0) {
        result.add(div);
        n = n ~/ div; // целочисленное деление = (n / div).toInt()
      }
      div = primeNumbers.next();
    }
  }
}

// Решето Эратосфена. Sieve of Eratosthenes
class PrimeNumbers {
  int index = 0;

  late final List<int> list;

  PrimeNumbers(int n) {
    var a = List.generate(n + 1, (index) => index);
    for (int p = 2; p < n + 1; p++) {
      if (a[p] != 0) {
        for (int j = p * p; j < n + 1; j += p) {
          a[j] = 0;
        }
      }
    }

    list = a.where((e) => e != 0).toList();
  }

  next() {
    return list[index++];
  }

  reset() {
    index = 0;
  }
}

// Нахождение корня n-ой степени
class NthRoot {
  late final double value;

  NthRoot(double num, int n) {
    if (n <= 0) {
      throw ArgumentError('"n" must be greater 0');
    }

    if (num < 0) {
      throw ArgumentError('"num" must be greater or equal 0');
    }

    if (num == 0.0) {
      value = 0.0;
      return;
    }

    var xPre = 1.0;
    var eps = 0.001;
    var delX = 2147483647.0;
    var xK = 0.0;

    while (delX > eps) {
      xK = ((n - 1.0) * xPre + num / computePower(xPre, n - 1)) / n;
      delX = (xK - xPre).abs();
      xPre = xK;
    }

    value = double.parse((xK).toStringAsFixed(3));
  }
}

double computePower(double num, exponent) {
  var result = 1.0;
  for (var i = 0; i < exponent; i++) {
    result *= num;
  }
  return result;
}
