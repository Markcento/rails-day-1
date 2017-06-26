class GameController < ApplicationController
  def game
    @result
    @stored_secret
    @secretnumber = 13
    session[:secretnumber] = @secretnumber
    # raise params.inspect
    @name = "Mark"
    @number = params[:number].to_i
    @counter = cookies[:counter].to_i

    # if !cookies[:secretnumber].present?
    #   cookies[:secretnumber] = rand(1..100)
    #   @secretnumber = cookies[:secretnumber].to_i
    # else
    if @number < @secretnumber
        @result = "Too low"
        @counter += 1
        cookies[:counter] = @counter
    elsif @number > @secretnumber
      @result = "Too High"
      @counter += 1
      cookies[:counter] = @counter
    else
      cookies.delete :counter
      redirect_to controller: 'new', action: 'reset'
    end
  end
end
