module Adapters
  class DerivationPrivacyFilter
    class << self
      def get_derivations(current)
        my_theme = current.derivations
        all_public = Derivation.all().where(privacy:1)
        all_theme = (my_theme + all_public).uniq
        all_theme

    end
  end
  end
  end