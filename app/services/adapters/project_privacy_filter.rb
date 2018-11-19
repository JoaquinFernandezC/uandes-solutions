module Adapters
  class ProjectPrivacyFilter
    class << self
      def get_projects(current)
        my_theme = current.projects
        all_public = Project.all().where(privacy:1)
        all_theme = (my_theme + all_public).uniq
        all_theme

    end
  end
  end
  end