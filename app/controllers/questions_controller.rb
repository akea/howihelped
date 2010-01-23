class QuestionsController < ApplicationController
  has_rakismet
  before_filter :login_required, :except => [:index, :show, :construction]
  before_filter :find_question, :except => [:index, :new, :create]

  def index
    @questions = Question.no_downvotes
    @question = Question.new
    @section = :default
  end
  
  def show
    @answer = @question.answers.new
    @vote = @question.votes.new
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = current_user.questions.new(params[:question])
    @question.request = request
    if @question.save
      unless CHECK_SPAM && !@question.approved?
        flash[:notice] = "Your new report has been added. Thank you."
      else
        flash[:error] = "Unfortunately this report is considered spam by Akismet. " +
                        "It will show up once it has been approved by the administrator."
      end
      redirect_to @question
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated question."
      redirect_to @question
    else
      render :action => 'edit'
    end
  end
  

  protected

  def destroy
    @question.destroy
    flash[:notice] = "Successfully destroyed question."
    redirect_to questions_url
  end

  def approve
    @question.mark_as_ham!
    redirect_to @question
  end

  def reject
    @question.mark_as_spam!
    redirect_to questions_url
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
