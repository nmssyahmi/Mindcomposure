import 'package:mindcomposure/src/model/DASSQuestion.dart';

//Question
List<Question> questions = <Question>[
  Question(text: '1)I found it hard to wind down', type: 'STRESS'),
  Question(text: '2)I was aware of dryness of my mouth', type: 'ANXIETY'),
  Question(
      text: '3)I could not seem to experience any positive feeling at all',
      type: 'DEPRESSION'),
  Question(
      text:
          '4)I experienced breathing difficulty (eg, excessively rapid breathing)',
      type: 'ANXIETY'),
  Question(
      text: '5)I found it difficult to work up the initiative to do things',
      type: 'DEPRESSION'),
  Question(text: '6)I tended to over-react to situations', type: 'STRESS'),
  Question(
      text: '7)I experienced trembling (eg, in the hands)', type: 'ANXIETY'),
  Question(
      text: '8)I felt that I was using a lot of nervous energy',
      type: 'STRESS'),
  Question(
      text:
          '9)I was worried about situations in which I might panic and make a fool of myself',
      type: 'ANXIETY'),
  Question(
      text: '10)I felt that I had nothing to look forward to',
      type: 'DEPRESSION'),
  Question(text: '11)I found myself getting agitated', type: 'STRESS'),
  Question(text: '12)I found it difficult to relax', type: 'STRESS'),
  Question(text: '13)I felt down-hearted and blue', type: 'DEPRESSION'),
  Question(
      text:
          '14)I was intolerant of anything that kept me from getting on with what I was doing',
      type: 'STRESS'),
  Question(text: '15)I felt I was close to panic', type: 'ANXIETY'),
  Question(
      text: '16)I was unable to become enthusiastic about anything',
      type: 'DEPRESSION'),
  Question(
      text: '17)I felt I was not worth much as a person', type: 'DEPRESSION'),
  Question(text: '18)I felt that I was rather touchy', type: 'STRESS'),
  Question(
      text:
          '19)I was aware of the action of my heart in the absence of physical exertion (eg, sense of heart rate increase)',
      type: 'ANXIETY'),
  Question(text: '20)I felt scared without any good reason', type: 'ANXIETY'),
  Question(text: '21)I felt that life was meaningless', type: 'DEPRESSION'),
];

//list_answer
const List<Answer> answers = <Answer>[
  Answer(text: 'Did not apply to me at all', value: 0),
  Answer(text: 'Applied to me to some degree', value: 1),
  Answer(text: 'Applied to me to a considerable degree', value: 2),
  Answer(text: 'Applied to me most of the time ', value: 3),
];
