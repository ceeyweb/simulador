class AdminLogin
  include ActiveModel::Model

  attr_accessor :username, :password

  def valid?
    administrator.present? && administrator.authenticate(password)
  end

  private

  def administrator
    @administrator ||= Administrator.find_by(username: username)
  end
end
