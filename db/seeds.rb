# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tasks = Task.create([{name: 'Task', user_id: 1, start_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"), 
    end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"), privacy: 1, priority: 2, state: 'In progress', needs_checking: true}])

institutions = Institution.create([{ name: 'Burger King' }, { name: 'Nike' }, { name: 'Reebok' }, { name: 'Uandes' }, { name: 'Google' },
                                   { name: 'Wallmart' }, { name: 'Amazon' }, { name: 'Copec' }, { name: 'Falabella' }, { name: 'HP' },
                                   { name: 'Microsoft' }])

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

employees = Employee.create([
                              { person_id: 1, institution_id: 5, position: 'Cargo 1' },
                              { person_id: 5, institution_id: 4, position: 'Cargo 2' },
                              { person_id: 6, institution_id: 8, position: 'Cargo 3' },
                              { person_id: 8, institution_id: 2, position: 'Cargo 4' },
                              { person_id: 1, institution_id: 1, position: 'Cargo 5' },
                              { person_id: 3, institution_id: 4, position: 'Cargo 6' },
                              { person_id: 2, institution_id: 9, position: 'Cargo 7' },
                            ])

user = User.create!([
                    {first_name: 'Josefina', last_name: 'Flores', rut: '15.265.385-K', rol: 'Funcionario',
                     position: 'Secretario', email: 'jflores@ulddeco.cl', password: '123456',
                     password_confirmation: '123456'},
                    {first_name: 'Alfonso', last_name: 'Zúñiga', rut: '19.475.275-K', rol: 'Funcionario',
                     position: 'Gerencia', email: 'ajzuniga1@miuandes.cl', password: '123456',
                     password_confirmation: '123456'},
                    {first_name: 'Ángeles', last_name: 'Aldunate', rut: '18.476.921-6', rol: 'Funcionario',
                     position: 'Secretaria', email: 'adaldunate@miuandes.cl', password: '123456',
                     password_confirmation: '123456'}]),

ruc = Ruc.create(number: 420)

prosecutor = Prosecutor.create(name: 'Guillermo Toro', rut: '8547962-8', local_office: 'My office')

rpo = RegionalProsOffice.create(region: 'Metropolitana', prosecutor: prosecutor)

log = Log.create

cause = Cause.create(
    name: 'PENTA',
    regional_pros_office_id: rpo.id,
    description: 'This case is really f*cked up yall',
    privacy: 2,
    state: 'Open',
    prosecutor_id: prosecutor.id,
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    ruc_id: ruc.id,
    log_id: log.id
)

privacy = PrivacyLevel.create([{ tag: 'Público' }, { tag: 'Privado' }, { tag: 'Secreto' }])

status = Status.create([{ tag: 'Abierto' }, { tag: 'Cerrado' }, { tag: 'Revisión' }, { tag: 'Abortado' }])
