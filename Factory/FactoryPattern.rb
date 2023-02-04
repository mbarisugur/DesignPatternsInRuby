class UserFactory
  def call(user_type)
    if user_type == "admin"
      Admin.new
    elsif user_type == "member"
      Member.new
    else
      Guest.new
    end

  end
end

class Endpoint
  def home(params)
    user = UserFactory.call(params[:user_type])
    {first_name: user.first_name}.to_json
  end
end