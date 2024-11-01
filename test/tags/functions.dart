class SomeClass {
  //  ^ @definition.class
  final str = '';
  int get getter => 12;
  //    ^ @definition.method
  void set setter(int value) {}
  //    ^ @definition.method
  void method() => print('asdf');
  //    ^ @definition.method
}

String topLevelFn() => 'str';
//      ^ @definition.function

extension SomeExtension on SomeClass {
  void extensionMethod() => print('extension');
  //    ^ @definition.function
}

void main() {
  final instance = SomeClass();
  instance.str;
  //        ^ property
  instance.getter;
  //        ^ property
  instance.setter = 12;
  //        ^ property
  instance.method();
  //        ^ function
  topLevelFn();
  // <- function
  instance.extensionMethod();
  //          ^ function
  instance
    ..method()
    //     ^ function
    ..str
    //   ^ property
    ..getter;
  //   ^ property
}

