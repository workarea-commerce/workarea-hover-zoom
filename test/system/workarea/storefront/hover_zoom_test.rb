require 'test_helper'

module Workarea
  module Storefront
    class HoverZoomTest < Workarea::SystemTest
      include BreakpointHelpers

      def test_setup_zoom_image_on_desktop
        visit storefront.product_path(create_product)

        primary_image_link.hover
        wait_for_xhr

        assert plugin_magnify?
      end

      def test_setup_zoom_image_on_mobile
        resize_window_to('small')
        visit storefront.product_path(create_product)

        wait_for_xhr

        assert plugin_zoom?
      end

      private

      def primary_image
        page.find('.product-details__primary-image')
      end

      def primary_image_link
        primary_image.find('a')
      end

      def plugin_magnify?
        has_class?(primary_image, 'hover-zoom--magnify')
      end

      def plugin_zoom?
        has_class?(primary_image, 'hover-zoom--zoom')
      end

      def has_class?(element, klass)
        element[:class].split.include?(klass)
      end
    end
  end
end
