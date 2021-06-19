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
Question.create([
                  { body: 'как в PHP создать новую переменную с именем animal и строковым значением ‘cat’?',
                    test_id: tests[0].id },
                  { body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: tests[1].id },
                  { body: 'Чем отличается puts от print?', test_id: tests[2].id },
                  { body: 'Каков размер «пустого» объекта?', test_id: tests[3].id },
                  { body: 'Допускается ли перегрузка деструкторов?', test_id: tests[4].id }
                ])

users[2].tests << [tests[0], tests[3], tests[4], tests[3], tests[3], tests[4]]
users[1].tests << [tests[0], tests[4], tests[2], tests[2]]
