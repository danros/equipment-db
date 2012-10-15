module UsersHelper
  # Delete any password digest errors: they're not useful to the user.
  def remove_password_digest_errors
    @user.errors.delete(:password_digest)
  end
end
