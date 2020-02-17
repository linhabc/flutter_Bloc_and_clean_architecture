import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numberQuote/features/number_trivia/domain/entities/number_trivia.dart';
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

  final testNumber = 1;
  final testNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'should get trivia from the number repository',
    () async {
      // arrange
      when(mockNumbertriviaRepository.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(testNumberTrivia));

      //act
      final result = await usecase(Params(number: testNumber));

      //assert
      expect(result, Right(testNumberTrivia));
      verify(mockNumbertriviaRepository.getConcreteNumberTrivia(testNumber));
      verifyNoMoreInteractions(mockNumbertriviaRepository);
    },
  );
}
