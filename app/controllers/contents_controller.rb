class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :set_page, only: [:new]


  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
    set_image(@content)

  end

  # POST /contents
  # POST /contents.json
  def create
    @page = Page.find(params[:page_id])
    @project = Project.find(@page.project_id)
    if params[:text]
      params[:text].each do |text|
        @content = Content.new
        @content.update(order: text[:order] , text: text[:content] , project_id: text[:project_id] , page_id: text[:page_id] , present_image: false  )
      end
    end

    if params[:one_photo]
      params[:one_photo].each do |photo|
        @content = Content.new
        @content.update(order: photo[:order] , project_id: photo[:project_id] , page_id: photo[:page_id] , present_image: true )
        params[:file].each do |file|
          if file[0] == photo[:order]
            file_correct = file[1]
            @content.images.create(order: file[0] , upload_photo: file_correct[0] , id_project: photo[:project_id] , id_page: photo[:page_id])
          end
        end
      end
    end
    ## default_photo
    if Image.last
      @project.update(default_photo: Image.last.id)
    else
      @project.update(default_photo: nil)
    redirect_to "/"
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    if @content.present_image
      set_image(@content)
      @images.each do |image|
        image.update( upload_photo: params[:content][:attachment])
      end
    else
      @content.update(text: params[:content][:text])
    end
    redirect_to "/pages/#{@content.page_id}/edit"
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params(content)
      content.permit(:text , :project_id , :page_id)
    end

    def set_image(content)
      @images= []
      Image.all.each do |image|
        if content.project_id == image.id_project && @content.page_id == image.id_page && @content.id == image.content_id
          @images << image
        end
      end
    end
end
