import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numberQuote/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:numberQuote/features/number_trivia/domain/usecases/get_concrete_number.dart';

class MockNumbertriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumbertriviaRepository mockNumbertriviaRepository;

  setUp(() {
    mockNumbertriviaRepository = MockNumbertriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumbertriviaRepository);
  });
}
