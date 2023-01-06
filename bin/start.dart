import 'package:start/dec2byte.dart';
import 'package:start/math_lib.dart';
import 'package:start/user_manager.dart';
import 'package:start/words_collection.dart';

void main(List<String> arguments) {
  // 1
  print('gcd(15, 12): ${GreatestCommonDivisor.compute(15, 12)}');
  print('lcm(15, 12): ${LeastCommonMultiple.compute(15, 12)}');
  print('primeFactorization(12): ${PrimeFactorization.find(12)}');
  print('primeFactorization(15): ${PrimeFactorization.find(15)}');

  // 2
  print('dec2byte(158): ${DecimalSystem(158).toByte()}');
  print('byte2dec(15): ${ByteSystem('10011110').toDecimal()}');

  // 3
  print('filterNumbers: ${OnlyNumbers.find(Words('Hi 1 test 2 yes 176'))}');

  // 4
  print(
      'WordsIncludingStats: ${WordsIncludingStats.compute(Words('hi test hi spam'))}');

  // 5
  print(
      'NumbersSet: ${OnlyUniqueNumbersSet.create(Words('two hi one nine hi two zero zero'))}');

  // 7
  print('nthRoot(81, 4): ${NthRoot.compute(81, 4)}');
  print('nthRoot(81, 2): ${NthRoot.compute(81, 2)}');
  print('nthRoot(0, 2): ${NthRoot.compute(0, 2)}');
  try {
    NthRoot.compute(20, 0);
  } catch (e) {
    print('nthRoot(20, 0): error: $e');
  }
  try {
    NthRoot.compute(-20, 2);
  } catch (e) {
    print('nthRoot(-20, 2): error: $e');
  }

  // 8
  var admin = AdminUser('admin@mail.ru');
  var ivan = GeneralUser('ivan@gmail.com');
  var alisa = GeneralUser('alisa@yandex.ru');
  var manager = UserManager()
    ..add(admin)
    ..add(ivan)
    ..add(alisa);

  manager.printUsers();
}
