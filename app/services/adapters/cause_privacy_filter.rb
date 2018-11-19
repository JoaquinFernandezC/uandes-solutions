module Adapters
  class CausePrivacyFilter
    class << self
      def get_causes(current)
        if current.rol < 4
          all_cases = Cause.all
        else
          my_cases = current.causes
          all_public = Cause.all().where(privacy:1)
          all_cases = (my_cases + all_public).uniq
        end
        all_cases
      end
    end
  end
end