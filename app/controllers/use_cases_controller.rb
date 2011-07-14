# coding: UTF-8
class UseCasesController < ApplicationController

  def index
    #FIXME the way to get project_id 
    session[:project_id]||=params['project_id']
    @use_cases = initialize_grid(UseCase, 
      :conditions=>["project_id=?", session[:project_id]],
      :order => 'id',
      :order_direction => 'desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end
  
  def new
    @use_case = UseCase.new(:project_id=>session['project_id'])

    respond_to do |format|
      format.html # new.html.erb
      format.json
    end
  end
  
  def edit
    @use_case = UseCase.find(params[:id])
  end
  
  def create
    @use_case = UseCase.new(params[:use_case].merge(:user_id=>session[:user_id]))

    respond_to do |format|
      if @use_case.save
        format.html { redirect_to(use_cases_path, :notice => 'Use case 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end
  
  def update
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      if @use_case.update_attributes(params[:use_case])
        format.html { redirect_to(use_cases_path, :notice => 'Use case 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end
  
  def destroy
    @use_case = UseCase.find(params[:id])
    @use_case.destroy

    respond_to do |format|
      format.html { redirect_to(use_cases_path,:notice => "删除成功。。。") }
      format.json
    end
  end
  
end
