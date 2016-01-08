class AppointmentsController < ApplicationController
  before_action :require_login


  def index
    @appointments = Appointment.all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def new
    @technician_id = params[:id]
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    #grab instance of technician by id
     #create new instance of Appointment(using incoming params)
     #add new Appointment to technicians appointments
     # ' technician.appointments << Appointmnent.new(params)'
     # save technician
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def delete
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to technicians_edit_path(params[:id])
  end

    def appointment_params
    params.require(:appointment).permit(:technician_id, :service_id, :date, :time)
    end

private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to :back # halts request cycle
    end
  end
end
