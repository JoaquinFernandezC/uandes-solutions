# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


tasks = Task.create([{name: 'Task', user_id: 1, start_date: DateTime.strptime("09/14/2019 8:00",
                                                                              "%m/%d/%Y %H:%M"),
                      end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
                      privacy: 1, priority: 2, state: 'In progress', needs_checking: true}])

institutions = Institution.create([{ name: 'Burger King' }, { name: 'Nike' }, { name: 'Reebok' },
                                   { name: 'Uandes' }, { name: 'Google' }, { name: 'Wallmart' }, { name: 'Amazon' },
                                   { name: 'Copec' }, { name: 'Falabella' }, { name: 'HP' }, { name: 'Microsoft' }])

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
                    {first_name: 'Camila', last_name: 'Torres', rut: '16.265.385-K', rol: 1,
                     position: 'Director', email: 'ctor@ulddeco.com', password: '123456',
                     password_confirmation: '123456'},
                    {first_name: 'Jose', last_name: 'Marmól', rut: '14.475.275-K', rol: 4,
                     position: 'Funcionario', email: 'jmar@ulddeco.com', password: '123456',
                     password_confirmation: '123456'},
                    {first_name: 'Veronica', last_name: 'Dominguez', rut: '13.476.921-6', rol: 3,
                     position: 'Secretaria', email: 'vdom@ulddeco.com', password: '123456',
                     password_confirmation: '123456'},
                    {first_name: 'Geronimo', last_name: 'Escudero', rut: '12.476.921-1', rol: 2,
                     position: 'TI', email: 'gesc@ulddeco.com', password: '123456',
                     password_confirmation: '123456'}])

ruc = Ruc.create(number: 420)



prosecutor = Prosecutor.create(name: 'Guillermo Toro', rut: '8547962-8', local_office: 'My office')

rpo = RegionalProsOffice.create(region: 'Metropolitana', prosecutor: prosecutor)

log = Log.create

privacy = PrivacyLevel.create([{ tag: 'Público' }, { tag: 'Privado' }, { tag: 'Secreto' }])

status = Status.create([{ tag: 'Abierto' }, { tag: 'Cerrado' }, { tag: 'Revisión' }, { tag: 'Abortado' }])

cause = Cause.create([
    {name: 'PENTA',
    regional_pros_office_id: rpo.id,
    description: 'Este es un caso complicado',
    privacy: 2,
    state: 'Open',
    prosecutor_id: prosecutor.id,
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    ruc_id: ruc.id,
    log_id: log.id},
    {name: 'OCTO',
    regional_pros_office_id: rpo.id,
    description: 'Este es un caso demasiado complicado',
    privacy: 1,
    state: 'Open',
    prosecutor_id: prosecutor.id,
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    ruc_id: ruc.id,
    log_id: log.id},
    {name: 'HEXA',
    regional_pros_office_id: rpo.id,
    description: 'Este es un caso muy complicado',
    privacy: 3,
    state: 'Open',
    prosecutor_id: prosecutor.id,
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    ruc_id: ruc.id,
    log_id: log.id}])

cc = CaseCoordination.create([
    {name: 'Robo Andino',
    description: 'Se sospechan muchas cosas',
    privacy: 1,
    state: 'Abierto',
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id},
	{name: 'Coalición Confort',
    description: 'Nadie encuentra sus 7 lucas',
    privacy: 2,
    state: 'Cerrado',
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id},
    {name: 'Lavado de dinero',
    description: 'Nadie sospechara de nosotros',
    privacy: 3,
    state: 'Revisión',
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id}])

iic = Iic.create([
    {name: 'Iic Generica',
    description: 'Descripcion generica',
    privacy: 1,
    state: 'Abierto',
    multilateral: false,
    start_date: DateTime.strptime("12/22/2018 8:00", "%m/%d/%Y %H:%M"),
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id},
	{name: 'Iic bastante Generica',
    description: 'Muy generico',
    privacy: 2,
    state: 'Cerrado',
    multilateral: false,
    start_date: DateTime.strptime("12/22/2018 8:00", "%m/%d/%Y %H:%M"),
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id},
    {name: 'Iic mas Generica',
    description: 'Descripcion demasiado generica',
    privacy: 3,
    state: 'Revisión',
    multilateral: false,
    start_date: DateTime.strptime("12/22/2018 8:00", "%m/%d/%Y %H:%M"),
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id}])

project = Project.create([
{name: 'Proyecto alfa',
    objective: 'Descripcion generica',
    privacy: 1,
    state: 'Abierto',
    year: 2019,
    project_number: 2,
    start_date: DateTime.strptime("12/22/2018 8:00", "%m/%d/%Y %H:%M"),
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id},
	{name: 'Proyecto gamma',
    objective: 'Muy generico',
    privacy: 2,
    state: 'Cerrado',
    year: 2019,
    project_number: 1,
    start_date: DateTime.strptime("12/22/2018 8:00", "%m/%d/%Y %H:%M"),
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id},
    {name: 'Proyecto betta',
    objective: 'Descripcion demasiado generica',
    privacy: 3,
    state: 'Revisión',
    year: 2019,
    project_number: 3,
    start_date: DateTime.strptime("12/22/2018 8:00", "%m/%d/%Y %H:%M"),
    estimated_end_date: DateTime.strptime("09/14/2019 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("11/14/2019 8:00", "%m/%d/%Y %H:%M"),
    log_id: log.id}])



task = Task.create([
    {name: 'Conferencia de Prensa', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 1, estimated_end_date: '21/12/2018', privacy: 0, priority: 1, state: 'Revisión', needs_checking: true},
    {name: 'Arriendo Centro de Eventos', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 2, estimated_end_date: '03/04/2019', privacy: 2, priority: 0, state: 'Abierto', needs_checking: true},
    {name: 'Audiencia Juridica', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 3, estimated_end_date: '17/02/2019', privacy: 0, priority: 1, state: 'Abierto', needs_checking: false},
    {name: 'Imprimir Flyers', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 4, estimated_end_date: '07/02/2019', privacy: 0, priority: 0, state: 'Abierto', needs_checking: false},
    {name: 'Reunion con Comisario', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 2, estimated_end_date: '21/04/2019', privacy: 1, priority: 1, state: 'Abierto', needs_checking: true},
    {name: 'Reunion Fica-Com', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 1, estimated_end_date: '05/11/2018', privacy: 2, priority: 2, state: 'Abierto', needs_checking: false},
    {name: 'Entrega Final', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 3, estimated_end_date: '10/11/2018', privacy: 0, priority: 1, state: 'Abierto', needs_checking: true},
    {name: 'Final Finalisimo', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 4, estimated_end_date: '10/11/2018', privacy: 0, priority: 1, state: 'Abierto', needs_checking: true}, {name: 'Terminar Presentacion', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 2, estimated_end_date: '21/04/2019', privacy: 1, priority: 1, state: 'Abierto', needs_checking: true},
    {name: 'Comprar comida para convivencia', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 1, estimated_end_date: '05/11/2018', privacy: 2, priority: 2, state: 'Abierto', needs_checking: false},
    {name: 'Entrega Final', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 3, estimated_end_date: '10/11/2018', privacy: 0, priority: 1, state: 'Abierto', needs_checking: true},
    {name: 'Final Finalisimo', description: 'Dar informacion sobre el gangster mas peligroso al publico.',
     user_id: 4, estimated_end_date: '10/11/2018', privacy: 0, priority: 1, state: 'Abierto', needs_checking: true}
    ])


causeTask = CaseTask.create([{task_id: 1, cause_id: 2}, {task_id: 2, cause_id: 3}, {task_id: 4, cause_id: 1}, {task_id: 3, cause_id: 1}])

ccTask = CcTask.create([{task_id: 5, case_coordination_id: 2}, {task_id: 6, case_coordination_id: 3}, {task_id: 7, case_coordination_id: 1}, {task_id: 8, case_coordination_id: 1}])

projectTask = ProjectTask.create([{task_id: 9, project_id: 1}, {task_id: 10, project_id: 2}, {task_id: 11, project_id: 4}, {task_id: 12, project_id: 3}])
