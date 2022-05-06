import 'package:mocktail/mocktail.dart';
import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';

class MockAuthor extends Mock implements Author {}

class MockBook extends Mock implements Book {}

class MockChapterList extends Mock implements ChapterList {}

class MockChapter extends Mock implements Chapter {}

class MockContent extends Mock implements Content {}

class MockIndexableContent extends Mock with Indexable implements Content {}

class MockHeading extends Mock implements Heading {}

class MockIndex extends Mock implements Index {}

class MockReference extends Mock implements Reference {}

class MockIndexable extends Mock implements Indexable {}

class MockRenderable extends Mock implements Renderable {}
