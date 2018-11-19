module Adapters
  class CausePrivacyFilter
    class << self
      def get_causes(current)
        my_cases = current.causes
        all_public = Cause.all().where(privacy:1)
        all_cases = (my_cases + all_public).uniq
        all_cases

    end
  end
  end
  end