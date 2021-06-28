# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: 'Sasha', email: 'sasha@somemail.com' },
  { name: 'Joseph', email: 'joseph007@somemail.com' },
  { name: 'Agatha', email: 'agatha_best@somemail.com' },
  { name: 'Admin', email: 'administration@bossmail.com' },
  { name: 'Stranger', email: 'empty@nomail.com' }
])

categories = Category.create([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'Data Science' }
])

tests = Test.create([
  { title: 'Ruby', level: 0, category_id: categories[0].id },
  { title: 'Go', level: 1, category_id: categories[0].id },
  { title: 'HTML', level: 0, category_id: categories[1].id },
  { title: 'Python', level: 2, category_id: categories[2].id },
  { title: 'R', level: 0, category_id: categories[2].id },
])

questions = Question.create([
  { body: 'Что содержит в себе атрибут href?', test_id: tests[2].id },
  { body: 'Что такое дескрипторы?', test_id: tests[3].id },
  { body: 'Какая разница между include и extend?', test_id: tests[0].id },
  { body: 'Как получить прямой доступ к ячейкам памяти?', test_id: tests[1].id },
  { body: 'Как вызвать список всех объектов?', test_id: tests[4].id }
])

answers = Answer.create([
  { title: 'Ответ №1', correct: true, question_id: questions[0].id },
  { title: 'Ответ №2', question_id: questions[0].id },
  { title: 'Ответ №1', question_id: questions[1].id },
  { title: 'Ответ №2', correct: true, question_id: questions[1].id },
  { title: 'Ответ №1', correct: true, question_id: questions[2].id },
  { title: 'Ответ №2', question_id: questions[2].id },
  { title: 'Ответ №1', question_id: questions[3].id },
  { title: 'Ответ №2', correct: true, question_id: questions[3].id },
  { title: 'Ответ №1', question_id: questions[4].id },
  { title: 'Ответ №2', correct: true, question_id: questions[4].id }
])