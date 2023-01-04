class DecimalSystem {
  final int decimalNumber;

  DecimalSystem(this.decimalNumber);

  String toByte() {
    return decimalNumber.toRadixString(2);
  }
}

class ByteSystem {
  final String binaryNumber;

  ByteSystem(this.binaryNumber);

  int toDecimal() {
    return int.parse(binaryNumber, radix: 2);
  }
}
