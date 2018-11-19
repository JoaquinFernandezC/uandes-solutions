module Adapters
  class CcPrivacyFilter
    class << self
      def get_cc(current)
        if current.rol < 4
          all_theme = CaseCoordination.all
        else
          my_theme = current.case_coordinations
          all_public = CaseCoordination.all().where(privacy:1)
          all_theme = (my_theme + all_public).uniq
        end
        all_theme
      end
    end
  end
end