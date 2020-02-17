import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numberQuote/core/usecase/usecase.dart';
import 'package:numberQuote/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:numberQuote/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:numberQuote/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final testNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia from the number repository', () async {
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async {
      return Right(testNumberTrivia);
    });

    final result = await usecase(NoParams());

    expect(result, Right(testNumberTrivia));

    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
