module Workarea
  module HoverZoom
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::HoverZoom
    end
  end
end
