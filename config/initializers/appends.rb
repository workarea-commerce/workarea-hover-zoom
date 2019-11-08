module Workarea
  Plugin.append_stylesheets(
    'storefront.components',
    'workarea/storefront/hover_zoom/components/hover_zoom.scss'
  )

  Plugin.append_javascripts(
    'storefront.config',
    'workarea/storefront/hover_zoom/config'
  )

  Plugin.append_javascripts(
    'storefront.modules',
    'workarea/storefront/hover_zoom/modules/hover_zooms'
  )
end
