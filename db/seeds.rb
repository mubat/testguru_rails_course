# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
                      { name: 'admin', login: 'admin', password: 'admin' },
                      { name: 'manager1', login: 'manager', password: '123123' },
                      { name: 'user', login: 'user', password: '123123' }
                    ])
categories = Category.create([{ title: 'С++ за 21 день' }, { title: 'Ruby с нуля' }, { title: 'Стать гуру в PHP' }])
tests = Test.create([
                      {
                        title: 'Я слишком молод, чтобы умереть',
                        level: 0,
                        category_id: categories[2].id,
                        created_by_id: users[0].id
                      },
                      { title: 'Эй, не так грубо', level: 1, category_id: categories[1].id, created_by_id: users[1].id },
                      { title: 'Сделай мне больно', level: 2, category_id: categories[1].id, created_by_id: users[1].id },
                      { title: 'Сверхнасилие', level: 3, category_id: categories[0].id, created_by_id: users[1].id },
                      { title: 'Кошмар!', level: 4, category_id: categories[0].id, created_by_id: users[1].id }
                    ])
questions = Question.create([
                              { body: 'как в PHP создать новую переменную с именем animal и строковым значением ‘cat’?',
                                test_id: tests[0].id },
                              { body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: tests[1].id },
                              { body: 'Чем отличается puts от print?', test_id: tests[2].id },
                              { body: 'Каков размер «пустого» объекта?', test_id: tests[3].id },
                              { body: 'Допускается ли перегрузка деструкторов?', test_id: tests[4].id }
                            ])

users[2].tests << [tests[0], tests[3], tests[4], tests[3], tests[3], tests[4]]
users[1].tests << [tests[0], tests[4], tests[2], tests[2]]

answers = Answer.create([
                          { body: 'animal = ‘cat’;', question_id: questions[0].id },
                          { body: '$animal = cat', question_id: questions[0].id },
                          { body: 'string animal = “cat”;', question_id: questions[0].id },
                          { body: 'var animal = ‘cat’;', question_id: questions[0].id },
                          { body: '$animal = ‘cat’;', question_id: questions[0].id },

                          { body: 'lowercase()', question_id: questions[1].id },
                          { body: 'down()', question_id: questions[1].id },
                          { body: 'downcase()', question_id: questions[1].id },
                          { body: 'dcase()', question_id: questions[1].id },

                          { body: 'Ничем, оба делают одно и тоже', question_id: questions[2].id },
                          { body: 'print без пропуска строки, а puts с пропуском', question_id: questions[2].id },
                          { body: 'puts позволяет выводить переменные, а print только текст', question_id: questions[2].id },

                          { body: '1 бит', question_id: questions[3].id },
                          { body: '47 байт', question_id: questions[3].id },
                          { body: '1 байт', question_id: questions[3].id },
                          { body: 'пустой объект не занимает памяти', question_id: questions[3].id },

                          { body: 'Да', question_id: questions[4].id },
                          { body: 'Нет', question_id: questions[4].id }
                        ])
