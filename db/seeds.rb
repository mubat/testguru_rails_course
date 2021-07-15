# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
                      {
                        name: 'admin',
                        email: 'admin@testguru.com',
                        password: '123123',
                        confirmed_at: DateTime.now
                      },
                      {
                        name: 'manager',
                        email: 'manager@testguru.com',
                        password: '123123',
                        confirmed_at: DateTime.now
                      },
                      {
                        "name": 'user',
                        "email": 'user@testguru.com',
                        password: '123123',
                        confirmed_at: DateTime.now
                      }
                    ])

categories = Category.create([{ title: 'С++ за 21 день' }, { title: 'Ruby с нуля' }, { title: 'Стать гуру в PHP' }])
tests = Test.create([
                      {
                        title: 'Я слишком молод, чтобы умереть',
                        level: 0,
                        category: categories[2],
                        created_by: users[0]
                      },
                      { title: 'Эй, не так грубо', level: 1, category: categories[1],
                        created_by: users[1] },
                      { title: 'Сделай мне больно', level: 2, category: categories[1],
                        created_by: users[1] },
                      { title: 'Сверхнасилие', level: 3, category: categories[0], created_by: users[1] },
                      { title: 'Кошмар!', level: 4, category: categories[0], created_by: users[1] }
                    ])
questions = Question.create([
                              { body: 'как в PHP создать новую переменную с именем animal и строковым значением ‘cat’?',
                                test: tests[0] },
                              { body: 'Какой метод позволяет привести строку в нижний регистр?', test: tests[1] },
                              { body: 'Чем отличается puts от print?', test: tests[2] },
                              { body: 'Каков размер «пустого» объекта?', test: tests[3] },
                              { body: 'Допускается ли перегрузка деструкторов?', test: tests[4] }
                            ])

users[2].tests << [tests[0], tests[3], tests[4], tests[3], tests[3], tests[4]]
users[1].tests << [tests[0], tests[4], tests[2], tests[2]]

answers = Answer.create([
                          { body: 'animal = ‘cat’;', question: questions[0] },
                          { body: '$animal = cat', question: questions[0] },
                          { body: 'string animal = “cat”;', question: questions[0] },
                          { body: 'var animal = ‘cat’;', question: questions[0] },
                          { body: '$animal = ‘cat’;', question: questions[0], is_correct: true },

                          { body: 'lowercase()', question: questions[1] },
                          { body: 'down()', question: questions[1] },
                          { body: 'downcase()', question: questions[1], is_correct: true },
                          { body: 'dcase()', question: questions[1] },

                          { body: 'Ничем, оба делают одно и тоже', question: questions[2] },
                          { body: 'print без пропуска строки, а puts с пропуском', question: questions[2],
                            is_correct: true },
                          { body: 'puts позволяет выводить переменные, а print только текст',
                            question: questions[2] },

                          { body: '1 бит', question: questions[3] },
                          { body: '47 байт', question: questions[3] },
                          { body: '1 байт', question: questions[3], is_correct: true },
                          { body: 'пустой объект не занимает памяти', question: questions[3] },

                          { body: 'Да', question: questions[4] },
                          { body: 'Нет', question: questions[4], is_correct: true }
                        ])
