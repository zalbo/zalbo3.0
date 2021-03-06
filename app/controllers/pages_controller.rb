class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @project = Project.find(params[:project_id])
    @pages = Page.where(project_id: params[:project_id])
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @contents = []
    Content.where(page_id: params[:id]).each do |content|
      if content.present_image
        @contents << Image.where(content_id: content.id)[0]
      else
        @contents << content
      end
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    @contents = []
    Content.all.each do |content|
      if content.project_id == @page.project_id
        if content.page_id == @page.id
          @contents << content
        end
      end
    end
    @contents = @contents.sort_by {|ctn| ctn.order}

    @images= []
    Image.all.each do |image|
      if @page.project_id == image.id_project
        @images << image
      end
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @project = Project.find(params[:page][:project_id])
    @page = Page.new(page_params)

    if @page.save

      redirect_to "/projects/#{@project.id}/pages/#{@page.id}/contents/new"
    else

    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @page.update(title: params[:page][:title])

    if @page.update(title: params[:page][:title])
      redirect_to "/projects/#{@page.project_id}/pages"
    else
      redirect_to "/projects/#{@page.project_id}/pages/#{@page.id}/edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy

    redirect_to "/projects/#{@page.project_id}/pages"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title , :project_id)
    end
end
