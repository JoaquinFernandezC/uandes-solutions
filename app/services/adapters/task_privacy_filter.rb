module Adapters
  class TaskPrivacyFilter
    #Adapters::TaskPrivacyFilter.get_tasks
    class << self
      def get_tasks(current)
        if current.rol < 4
          all_tasks_final = Task.all
        else
          my_tasks = Task.all().where(user_id: current.id)
          my_cases = current.causes
          my_cc = current.case_coordinations
          my_der =  current.derivations
          my_goals = current.goals
          my_project = current.projects
          my_iic = current.iic_management
          tasks_private = []
          my_cases.each do |cause|
            tasks_private.push(cause.tasks.where(privacy: 2))
            tasks_private.push(cause.tasks.where(privacy: 3))
          end
          my_cc.each do |cc|
            tasks_private.push(cc.tasks.where(privacy: 2))
            tasks_private.push(cc.tasks.where(privacy: 3))
          end
          my_der.each do |der|
            tasks_private.push(der.tasks.where(privacy: 2))
            tasks_private.push(der.tasks.where(privacy: 3))
          end
          my_goals.each do |goal|
            tasks_private.push(goal.tasks.where(privacy: 2))
            tasks_private.push(goal.tasks.where(privacy: 3))
          end
          my_project.each do |project|
            tasks_private.push(project.tasks.where(privacy: 2))
            tasks_private.push(project.tasks.where(privacy: 3))
          end
          my_iic.each do |iic|
            tasks_private.push(iic.tasks.where(privacy: 2))
            tasks_private.push(iic.tasks.where(privacy: 3))
          end
          public_tasks = Task.all().where(privacy: 1)

          all_tasks = []
          all_tasks = all_tasks + tasks_private
          all_tasks.push(public_tasks)
          all_tasks.push(my_tasks)
          all_tasks_final = []
          all_tasks.each do |task|
            task.each do |t|
              all_tasks_final.push(t)
            end
          end
          all_tasks_final = all_tasks_final.uniq
          all_tasks_final = Task.where(id: all_tasks_final.map(&:id))
        end
        all_tasks_final
      end
    end
  end
end