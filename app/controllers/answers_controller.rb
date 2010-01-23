class AnswersController < ApplicationController
  has_rakismet
  before_filter :login_required, :except => [:index, :show]
  before_filter :get_question, :except => [:index]
  before_filter :get_answer, :only => [:show, :edit, :update, :destroy]
  
  def index
    if params[:question_id]
      @question = Question.find(params[:question_id])
      redirect_to @question
    else
      redirect_to root_url
    end
  end

  def show
  end

  def new
    @answer = @question.answers.new   
  end

  def edit
  end

  def create
    @answer = @question.answers.new(params[:answer])
    @answer.request = request
    if (current_user.answers << @answer)
      unless CHECK_SPAM && !@answer.approved?
        flash[:notice] = "Your response has been added. Thank you."
      else
        flash[:error] = "Unfortunately this report is considered spam by Akismet. " +
                        "It will show up once it has been approved by the administrator."
      end
      respond_to do |format|
        format.html {redirect_to(@question)}
        format.js
      end
    else
      render :action => "new"
    end
  end

  def update
    if @answer.update_attributes(params[:answer])
      flash[:notice] = 'Answer was successfully updated.'
      redirect_to(@question)
    else
      render :action => "edit"
    end
  end

  def destroy
    @answer.destroy
    redirect_to(question_url(@question))
  end

  protected

  def get_question
    @question = Question.find(params[:question_id])
  end

  def get_answer
    @answer = @question.answers.find(params[:id])
  end

end
