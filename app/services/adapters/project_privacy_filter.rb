module Adapters
  class ProjectPrivacyFilter
    class << self
      def get_projects(current)
        if current.rol < 4
          all_theme = Project.all
        else
          my_theme = current.projects
          all_public = Project.all().where(privacy:1)
          all_theme = (my_theme + all_public).uniq
          all_theme = Project.where(id: all_theme.map(&:id))
        end
        all_theme
      end
    end
  end
end