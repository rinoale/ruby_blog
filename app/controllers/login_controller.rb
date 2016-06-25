class LoginController < ApplicationController
  helper_method :create_menu_node

  def new
    @menu_node = MENU_NODE['menunode']
  end

  def create
    redirect_to :root
  end

  def destroy
  end

  private

  def create_menu_node(menu_node, sub = false)
    html = ''
    menu_node.each do |menu_name, attr|
      html += "<li>"
      html += "<a href='#{attr['link'] || '#'}'>"
      html += "<i class='#{attr['class']}'></i>#{menu_name.tr('_', ' ')}</a>"
      html += create_menu_node(attr['subnode'], true) if attr['subnode']
      html += '</li>'
    end

    sub ? format("<ul>%s</ul>", html).html_safe : html.html_safe
  end
end
