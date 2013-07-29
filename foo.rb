u = User.new(params[:user]) {:admin => true}
u.name = "me"
u.password = "food"
u.admin = true

