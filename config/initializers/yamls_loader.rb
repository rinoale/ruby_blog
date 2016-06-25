require 'yaml'

MENU_NODE = YAML.load(File.open(Rails.root.join('config/yamls', 'menu_node.yml')))
