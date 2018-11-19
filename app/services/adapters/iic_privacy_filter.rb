module Adapters
  class IicPrivacyFilter
    class << self
      def get_iic(current)
        if current.rol < 4
          all_theme = Iic.all
        else
          my_theme = current.iic_management
          all_public = Iic.all().where(privacy:1)
          all_theme = (my_theme + all_public).uniq
          all_theme = Iic.where(id: all_theme.map(&:id))
        end
        all_theme
      end
    end
  end
end