module RenderPagesHelper
  def hide_navbar?
    current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(new_user_password_path)
  end

  def show_navbar?
    current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(new_user_password_path)
  end
end
