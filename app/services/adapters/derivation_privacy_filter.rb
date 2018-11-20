module Adapters
  class DerivationPrivacyFilter
    class << self
      def get_derivations(current)
        if current.rol < 4
          all_theme = Derivation.all
        else
          my_theme = current.derivations
          all_public = Derivation.all().where(privacy:1)
          all_theme = (my_theme + all_public).uniq
          all_theme = Derivation.where(id: all_theme.map(&:id))
        end
        all_theme
      end
    end
  end
end