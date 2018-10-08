# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

institutions = Institution.create([{ name: 'Burger King' }, { name: 'Nike' }, { name: 'Reebok' }, { name: 'Uandes' }, { name: 'Google' },
                                   { name: 'Wallmart' }, { name: 'Amazon' }, { name: 'Copec' }, { name: 'Falabella' }, { name: 'HP' },{ name: 'Microsoft' }])

persons = Person.create([
                        { name: 'Pedro Sanchez', rut: '11.518.914-k', passport: '11518914' },
                        { name: 'Max Garcia', rut: '7.504.797-5', passport: '7504797' },
                        { name: 'Timmy Turner', rut: '24.300.569-8', passport: '24300569' },
                        { name: 'Benjamin Garcia', rut: '19.627.517-7', passport: '19627517' },
                        { name: 'Macarena Hidalgo', rut: '14.148.111-8', passport: '14148111' },
                        { name: 'Claudio Recabarren', rut: '24.258.200-4', passport: '24258200' },
                        { name: 'Matias Alvarez', rut: '23.109.261-7', passport: '23109261' },
                        { name: 'Esperanza Aldunate', rut: '6.244.786-9', passport: '6244786' },
                        { name: 'Angeles Uribe', rut: '14.257.947-2', passport: '14257947' },
                        { name: 'Margarita Estevez', rut: '15.823.662-1', passport: '15823662' },
                        ])