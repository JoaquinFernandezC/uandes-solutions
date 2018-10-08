class EmployeesController < ApplicationController
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: {object: @employee, text: '('+@employee.institution.name+') '+@employee.person.name}
    else
      render json: {errors: @employee.errors.full_messages}
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:person_id, :institution_id, :position)
    end
end
