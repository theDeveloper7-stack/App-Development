class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;

    // we copied the existing list in the final variable shuffledList
    // then apply shuffle() to it and now we use this shuffledList in our AnswerButton
    // so that it will not change the actual list that we created
  }
}
