module ApplicationHelper
  def render_devise_message(msg)
    @msg_dvs_rnded = msg.slice((msg.index('<h2>'))..(msg.index(':</h2>'))).sub!("<h2>", "")
  end
end
