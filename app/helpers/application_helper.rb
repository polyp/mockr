# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_text(text)
    text = nl2br(h text)
    auto_link(text, :all, :target => "_blank").html_safe
  end

  def nl2br(text)
    text.gsub(/\r\n?/, "\n").gsub(/\n/, '<br />').html_safe
  end

  def fbml_plain_name(user, options={})
    fbuid = user.facebook_uid rescue user

    default_options = {
      :uid           => fbuid.to_s,
      :useyou        => 'false',
      :firstnameonly => 'true',
      :linked        => 'false'
    }
    options = default_options.merge(options)
    attributes = options.map{|pair| pair.join('=')}.join(' ')

    "<fb:name #{attributes}></fb:name>".html_safe
  end

  def login_button
    "<fb:login-button size='large'>Login with Facebook</fb:login-button>".html_safe
  end

  def logout_link(text)
    link_to(text, logout_path, :onclick => "FB.logout();", :id => "logout")
  end
end
