class HomeController < ApplicationController  
  
  def index
    if logged_in?
      @topics = Topic.paginate(:page => params[:page], :per_page => Topic::PER_PAGE, :include => [:user, :forum, :last_poster], :order => 'topics.last_post_at desc')
      render(:template => "topics/index")
    else
      render(:template => "users/login")
    end
  end
  
end
