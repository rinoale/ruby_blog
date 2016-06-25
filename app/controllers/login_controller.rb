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
      node = attr['class'] ? format("<i class='%s'></i>%s", attr['class'], menu_name.tr('_', ' ')) : menu_name.tr('_', ' ')
      node = format("<a href='%s'>%s</a>", attr['link'] || '#', node)
      node += create_menu_node(attr['subnode'], true) if attr['subnode']
      html += format("<li>%s</li>", node)
    end

    sub ? format("<ul>%s</ul>", html).html_safe : html.html_safe
  end
end
