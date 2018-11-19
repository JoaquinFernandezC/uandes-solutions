module Adapters
  class IicPrivacyFilter
    class << self
      def get_iic(current)
        my_theme = current.iic_management
        all_public = Iic.all().where(privacy:1)
        all_theme = (my_theme + all_public).uniq
        all_theme

    end
  end
  end
  end