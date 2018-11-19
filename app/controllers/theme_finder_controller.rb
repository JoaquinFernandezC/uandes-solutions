class ThemeFinderController < ApplicationController

  require 'util'
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


  def report
    @query_parameters = request.query_parameters
    @filter = params[:filter]
    @filtered = false
    causes =Cause.all
    derivs = Derivation.all
    iics = Iic.all
    proys =Project.all
    ccs =CaseCoordination.all
    goals = Goal.all
    if @filter

      date_from = @filter[:date_from]
      if !date_from.nil? && date_from!=""
        @filtered = true
        # goals, causes, case_coordinations
        derivs = derivs.where("work_start_date>='#{date_from}' OR work_start_date IS NULL" )
        proys = proys.where("start_date>='#{date_from}' OR start_date IS NULL")
        iics = iics.where("start_date>='#{date_from}' OR start_date IS NULL")
      end

      date_until = @filter[:date_until]

      if !date_until.nil? && date_until!=""
        @filtered = true
        sql = "end_date<='#{date_until}' OR end_date is NULL"
        causes =causes.where(sql)
        derivs = derivs.where(sql)
        iics = iics.where(sql)
        proys = proys.where(sql)
        ccs = ccs.where(sql)
        goals = goals.where(sql)
      end
    end
    @themes = []
    causes.each do |cause|
      @themes<<cause
    end
    derivs.each do |deriv|
      @themes<<deriv
    end
    iics.each do |iic|
      @themes<<iic
    end
    proys.each do |proy|
      @themes<<proy
    end
    ccs.each do |cc|
      @themes<<cc
    end
    goals.each do |goal|
      @themes<<goal
    end

    @filter = if @filter.nil? then nil else OpenStruct.new(@filter) end

    respond_to do |format|
      format.html # show.html.erb
      format.csv {
        csv = "Tema,Macrotema,Fecha Inicio,Fecha Termino\n"
        @themes.each do |theme|
          row = ""
          row += theme.name
          row +=","
          row += Util.get_mtheme(theme)
          row +=","
          row += if theme.class.method_defined? :start_date then ( if !theme.start_date.nil? then theme.start_date.to_date.to_s else "Sin definir" end) else "N/A" end
          row +=","
          row += if !theme.end_date.nil? then theme.end_date.to_date.to_s else "Sin definir" end
          row += "\n"
          csv+=row
        end
        send_data csv,filename:"themes-report-#{Date.today}.csv"}
    end
  end


end
