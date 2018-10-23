class ThemeFinderController < ApplicationController

  def index
    @causes = Cause.all
    @case_coordinations = CaseCoordination.all
    @iics = Iic.all
    @derivations = Derivation.all
    @goals = Goal.all
    @projects = Project.all
  end

end
