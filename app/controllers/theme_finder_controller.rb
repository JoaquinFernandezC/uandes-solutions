class ThemeFinderController < ApplicationController

  require 'util'
  def index
    @privacy_by_id = Hash[PrivacyLevel.all.collect{|p| [p.id, p.tag]}]
    filter = params[:filter]
    @filtered = false

    @projects = Adapters::ProjectPrivacyFilter.get_projects(current_user)
    @goals = Adapters::GoalPrivacyFilter.get_goals(current_user)
    @causes = Adapters::CausePrivacyFilter.get_causes(current_user)
    @iics = Adapters::IicPrivacyFilter.get_iic(current_user)
    @case_coordinations = Adapters::CcPrivacyFilter.get_cc(current_user)
    @derivations = Adapters::DerivationPrivacyFilter.get_derivations(current_user)

    if !filter.nil?
      theme_name = filter[:name]
      if !theme_name.nil? && theme_name != ""
        @filtered = true
        theme_name = theme_name.strip()
        @causes = @causes.where("name LIKE '%#{theme_name}'")
        @goals = @goals.where("name LIKE '%#{theme_name}'")
        @projects = @projects.where("name LIKE '%#{theme_name}'")
        @iics = @iics.where("name LIKE '%#{theme_name}'")
        @case_coordinations = @case_coordinations.where("name LIKE '%#{theme_name}'")
        @derivations = @derivations.where("name LIKE '%#{theme_name}'")
      end

      statuses = Array(filter[:status])
      statuses.delete("")
      if !statuses.empty?
        @filtered = true
        statuses_tags = Status.where(id:statuses).collect{|r| r.tag}
        @causes = @causes.where(state:statuses_tags)
        @goals = @goals.where(state:statuses_tags)
        @projects = @projects.where(state:statuses_tags)
        @iics = @iics.where(state:statuses_tags)
        @case_coordinations = @case_coordinations.where(state:statuses_tags)
        @derivations = @derivations.where(state:statuses_tags)
      end

      privacy = Array(filter[:privacy])
      privacy.delete("")

      if !privacy.empty?
        @filtered = true
        @causes = @causes.where(privacy:privacy)
        @goals = @goals.where(privacy:privacy)
        @projects = @projects.where(privacy:privacy)
        @iics = @iics.where(privacy:privacy)
        @case_coordinations = @case_coordinations.where(privacy:privacy)
        @derivations = @derivations.where(privacy:privacy)
      end

      min_start_date, max_start_date = filter[:min_start_date], filter[:max_start_date]
      if min_start_date != "" and !min_start_date.nil?
        @filtered = true
        min_start_date = min_start_date.to_date.beginning_of_day
        @causes = @causes.where("created_at>=?",min_start_date)
        @goals = @goals.where("created_at>=?",min_start_date)
        @projects = @projects.where("created_at>=?",min_start_date)
        @iics = @iics.where("created_at>=?",min_start_date)
        @case_coordinations = @case_coordinations.where("created_at>=?",min_start_date)
        @derivations = @derivations.where("created_at>=?",min_start_date)
      end

      if max_start_date != "" and !max_start_date.nil?
        @filtered = true
        max_start_date = max_start_date.to_date.end_of_day
        @causes = @causes.where("created_at>=?",max_start_date)
        @goals = @goals.where("created_at>=?",max_start_date)
        @projects = @projects.where("created_at>=?",max_start_date)
        @iics = @iics.where("created_at>=?",max_start_date)
        @case_coordinations = @case_coordinations.where("created_at>=?",max_start_date)
        @derivations = @derivations.where("created_at>=?",max_start_date)
      end
    else
      @causes = Cause.all
      @case_coordinations = CaseCoordination.all
      @iics = Iic.all
      @derivations = Derivation.all
      @goals = Goal.all
      @projects = Project.all
    end
    @filter = if filter.nil? then nil else OpenStruct.new(filter) end
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
