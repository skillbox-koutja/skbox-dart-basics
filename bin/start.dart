import 'package:start/dec2byte.dart';
import 'package:start/math_lib.dart';
import 'package:start/user_manager.dart';
import 'package:start/words_collection.dart';

void main(List<String> arguments) {
  // 1
  // вычисления НОД целых чисел
  print('gcd(15, 12): ${GreatestCommonDivisor(15, 12).value}');
  // вычисления НОК целых чисел
  print('lcm(15, 12): ${LeastCommonMultiple(15, 12).value}');
  // метод, который разбивает число на простые множители и возвращает их.
  print('primeFactorization(12): ${PrimeFactorization(12).result}');
  print('primeFactorization(15): ${PrimeFactorization(15).result}');

  //2
  // метод для преобразования целых чисел из десятичной системы в двоичную
  print('dec2byte(158): ${DecimalSystem(158).toByte()}');
  // метод для преобразования целых чисел из двоичной системы в десятичную
  print('byte2dec(15): ${ByteSystem('10011110').toDecimal()}');

  // 3 Реализуйте метод, который принимает строку слов, разделённых пробелами. Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
  print('filterNumbers: ${OnlyNumbers(Words('Hi 1 test 2 yes 176'))}');

  // 4 Есть коллекция слов. Реализуйте метод, возвращающий Map. Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
  print(
      'WordsIncludingStats: ${WordsIncludingStats(Words('hi test hi spam'))}');

  // 5 Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого. Реализуйте метод, возвращающий цифры без повторений, которые встречаются в данной строке. Однако цифры встречаются в виде английских слов от zero до nine. Например, в результате строки ‘one, two, zero, zero’ мы получим следующий результат: [1, 2, 0]. Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.
  print('NumbersSet: ${NumbersSet(Words('two hi one nine hi two zero zero'))}');

  // 7 метод, который вычисляет корень любой заданной степени из числа.
  print('nthRoot(81, 4): ${NthRoot(81, 4).value}');
  print('nthRoot(81, 2): ${NthRoot(81, 2).value}');
  print('nthRoot(0, 2): ${NthRoot(0, 2).value}');
  try {
    NthRoot(20, 0);
  } catch (e) {
    print('nthRoot(20, 0): error: $e');
  }
  try {
    NthRoot(-20, 2);
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
