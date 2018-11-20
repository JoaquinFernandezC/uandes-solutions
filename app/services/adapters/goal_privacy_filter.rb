module Adapters
  class GoalPrivacyFilter
    class << self
      def get_goals(current)
        if current.rol < 4
          all_theme = Goal.all
        else
          my_theme = current.goals
          all_public = Goal.all().where(privacy:1)
          all_theme = (my_theme + all_public).uniq
          all_theme = Goal.where(id: all_theme.map(&:id))
        end
        all_theme
      end
    end
  end
end