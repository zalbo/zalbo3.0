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
  end

  # POST /contents
  # POST /contents.json
  def create

    params["contents"].each do |content|
      @content = Content.new
      if content["text"]
        @content.update(content.permit(:text , :project_id , :page_id))
        @content.update(present_image: false)
      else content["photo"]
        @content.update(project_id: content[:project_id] , page_id: content[:page_id] , present_image: true)
        @content.images.create(upload_photo: content[:photo] , id_project: content[:project_id] , id_page: content[:page_id])
      end
    end
    redirect_to "/projects/#{params[:contents][0][:project_id]}/pages/#{params[:contents][0][:page_id]}"
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
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
end
