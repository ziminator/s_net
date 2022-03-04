class PagesController < ApplicationController
  before_action :find_path, only: %i[show edit update destroy]

  def index
    @pages = Page.all
  end
  
  def show; end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)

    if @page.save
      redirect_to pages_path, notice: 'Page created'
    else
      render :new
    end
  end

  def edit; end
  
  def update
    if @page.update(page_params)
      redirect_to page_path(@page), notice: 'Page created'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path, notice: 'Page deleted'
  end
  
  private

  def find_path
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :permalink, :body)
  end
end
