class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update , :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

  end

  # GET /projects/1
  # GET /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    #check if the field is empty
    project_params.each do |key , value|
      if value == ""
        flash[:notice] = "il campo #{key} è vuoto"
        return redirect_to "/projects/new"
      end
    end

    @project = Project.new(project_params)

      if @project.save
        redirect_to "/projects/#{@project.id}/pages"
      end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.update(project_params)

    if @project.update(project_params)
      redirect_to "/projects/#{@project.id}/pages"
    else
      redirect_to "/projects/#{@project.id}/edit"
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    redirect_to "/projects"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content , :default_photo , :category)
    end


end
