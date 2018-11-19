class ThemeFinderController < ApplicationController

  def index
    @causes = Cause.all
    @case_coordinations = CaseCoordination.all
    @iics = Iic.all
    @derivations = Derivation.all
    @goals = Goal.all
    @projects = Project.all

    #@projects = Adapters::ProjectPrivacyFilter.get_projects(current_user)
    #@goals = Adapters::GoalPrivacyFilter.get_goals(current_user)
    #@causes = Adapters::CausePrivacyFilter.get_causes(current_user)
    #@iics = Adapters::IicPrivacyFilter.get_iic(current_user)
    #@case_coordinations = Adapters::CcPrivacyFilter.get_cc(current_user)
    #@derivations = Adapters::DerivationPrivacyFilter.get_derivations(current_user)

  end

end
