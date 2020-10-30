class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:succes] = 'タスクが正常に追加されました'
      redirect_to @task
    else
      flash[:danger] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  end

  def destroy
  end
end


private

# Storong Parameter
def task_params
  params.require(:message).permit(:content)
end