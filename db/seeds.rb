# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ title: 'С++ за 21 день' }, { title: 'Ruby с нуля' }, { title: 'Стать гуру в PHP' }])
tests = Test.create([
                      { title: 'Я слишком молод, чтобы умереть', level: 0, category_id: 3 },
                      { title: 'Эй, не так грубо', level: 1, category_id: 2 },
                      { title: 'Сделай мне больно', level: 2, category_id: 2 },
                      { title: 'Сверхнасилие', level: 3, category_id: 1 },
                      { title: 'Кошмар!', level: 4, category_id: 1 }
                    ])
Question.create([
                  { body: 'как в PHP создать новую переменную с именем animal и строковым значением ‘cat’?',
                    test_id: 1 },
                  { body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: 2 },
                  { body: 'Чем отличается puts от print?', test_id: 3 },
                  { body: 'Каков размер «пустого» объекта?', test_id: 4 },
                  { body: 'Допускается ли перегрузка деструкторов?', test_id: 5 }
                ])
users = User.create([
                      { name: 'admin', login: 'admin', password: 'admin' },
                      { name: 'manager1', login: 'manager', password: '123123' },
                      { name: 'user', login: 'user', password: '123123' }
                    ])

users[2].tests << [tests[0], tests[3], tests[4], tests[3], tests[3], tests[4]]
users[1].tests << [tests[0], tests[4], tests[2], tests[2]]
