module Adapters
  class GoalPrivacyFilter
    class << self
      def get_goals(current)
        my_theme = current.goals
        all_public = Goal.all().where(privacy:1)
        all_theme = (my_theme + all_public).uniq
        all_theme

    end
  end
  end
  end