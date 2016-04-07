module ApplicationHelper
  def render_devise_message(msg)
    @msg_dvs_rnded = msg.slice((msg.index('<h2>'))..(msg.index(':</h2>'))).sub!("<h2>", "")
  end

  def find_contents(project_id)
    @contents = []
    Content.all.each do |content|
      if content.project_id == project_id

          @contents << content
        end
    end
  end
end
