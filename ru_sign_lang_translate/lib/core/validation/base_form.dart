import 'package:formz/formz.dart';

abstract class BaseForm<T, E> extends FormzInput<T, E> {
  const BaseForm.dirty(T value) : super.dirty(value);

  const BaseForm.pure(T value) : super.pure(value);
  
}
