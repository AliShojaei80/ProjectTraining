//Ali Shojaei is Write this Code
import 'dart:io';
import 'dart:math';

void main() {
  final List<String> words = [
    'apple',
    'banana',
    'cherry',
    'date',
    'fig',
    'computer',
    'hello',
    'orange',
    'omg',
    'english,'
  ];
  final Random random = Random();
  final String selectedWord = words[random.nextInt(words.length)];
  final Set<String> guessedLetters = Set<String>();
  int remainingAttempts = 3;

  print('Welcome to the Word Guessing Game!');
  print('Try to guess the word.');

  while (remainingAttempts > 0) {
    print('\nWord: ${maskedWord(selectedWord, guessedLetters)}');
    print('Guessed letters: ${guessedLetters.join(', ')}');
    print('Remaining attempts: $remainingAttempts');

    final String guess = stdin.readLineSync()?.toLowerCase() ?? '';
    if (guess.length != 1 || !guess.contains(RegExp(r'[a-z]'))) {
      print('Please enter a single letter.');
      continue;
    }

    if (guessedLetters.contains(guess)) {
      print('You already guessed "$guess". Try another letter.');
      continue;
    }

    guessedLetters.add(guess);

    if (selectedWord.contains(guess)) {
      print('Correct! "$guess" is in the word.');
      if (maskedWord(selectedWord, guessedLetters) == selectedWord) {
        print('Congratulations! You guessed the word: $selectedWord');
        break;
      }
    } else {
      print('Sorry, "$guess" is not in the word.');
      remainingAttempts--;
    }
  }

  if (remainingAttempts == 0) {
    print('Game over! The word was: $selectedWord');
  }
}

String maskedWord(String word, Set<String> guessedLetters) {
  return word
      .split('')
      .map((letter) => guessedLetters.contains(letter) ? letter : '_')
      .join(' ');
}
