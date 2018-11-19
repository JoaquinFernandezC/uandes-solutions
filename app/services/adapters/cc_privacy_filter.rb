module Adapters
  class CcPrivacyFilter
    class << self
      def get_cc(current)
        my_theme = current.case_coordinations
        all_public = CaseCoordination.all().where(privacy:1)
        all_theme = (my_theme + all_public).uniq
        all_theme

    end
  end
  end
  end