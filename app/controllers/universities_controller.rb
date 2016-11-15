class UniversitiesController < ApplicationController
    

  def university_params
    params.require(:university).permit(:desc, :city, :state, :zip, :name, :collegeType, :rank, :acceptanceRate, :enrollment, :arrTuition)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @university = University.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @universities = University.all
    if params[:search]
       @universities = University.search(params[:search]).order("created_at DESC")
    else
       @universities = University.all.order('created_at DESC')
    end
  end


  def new
    # default: render 'new' template
  end

  def create
    @university = University.create!(university_params)
    flash[:notice] = "#{@university.name} was successfully created."
    redirect_to universities_path
  end

  def edit
    @university = University.find params[:id]
  end

  def update
    @university = University.find params[:id]
    @university.update_attributes!(university_params)
    flash[:notice] = "#{@university.name} was successfully updated."
    redirect_to university_path(@university)
  end

  def destroy
    @university = University.find(params[:id])
    @university.destroy
    flash[:notice] = "University '#{@university.title}' deleted."
    redirect_to universities_path
  end
    
end    