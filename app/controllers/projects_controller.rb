# coding: UTF-8
class ProjectsController < ApplicationController
  
  def index
    logger.debug "====session user_id=#{session[:user_id]}"
    @projects = initialize_grid(Project, 
      :conditions=>["user_id=?", session[:user_id]],
      :order => 'id',
      :order_direction => 'desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end
  
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def create
    @project = Project.new(params[:project].merge(:user_id=>session[:user_id]))

    respond_to do |format|
      if @project.save
        format.html { redirect_to(projects_path, :notice => 'Project 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end
  
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(projects_path, :notice => 'Project 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_path,:notice => "删除成功。") }
      format.json
    end
  end
end
