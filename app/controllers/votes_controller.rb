class VotesController < ApplicationController

  before_filter :find_votes_for_my_scope, :only => [:index]

  before_filter :login_required, :only => [:new, :edit, :destroy, :create, :update]
  before_filter :must_own_vote,  :only => [:edit, :destroy, :update]
  before_filter :not_allowed,    :only => [:edit, :update, :new]

  def index
  end

  def show
    @voteable = Vote.find(params[:id])
  end

  def create

    if request.url.include? "responses"
      # Answer vote
      @answer = Answer.find(params[:answer_id])
      @item = @answer
    else
      # Question vote
      @question = Question.find(params[:question_id])
      @item = @question
    end

    unless current_user.vote(@item, params[:vote])
      flash[:notice] = "Couldn't save your vote: You can only vote once, and you cannot vote for your own items."
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  private
  def find_votes_for_my_scope
    if params[:voteable_id]
      @votes = Vote.for_voteable(Voteable.find(params[:voteable_id])).descending
    elsif params[:user_id]
      @votes = Vote.for_voter(User.find(params[:user_id])).descending
    else
      @votes = []
    end
  end

  def must_own_vote
    @vote ||= Vote.find(params[:id])
    @vote.user == current_user || ownership_violation
  end

  def ownership_violation
    respond_to do |format|
      flash[:notice] = 'You cannot edit or delete votes that you do not own!'
      format.html do
        redirect_to user_path(current_user)
      end
    end
  end

end
