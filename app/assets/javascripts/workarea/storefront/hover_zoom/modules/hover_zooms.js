/**
 * @namespace WORKAREA.hoverZooms
 */
WORKAREA.registerModule('hoverZooms', (function () {
    'use strict';

    var attachZoom = function($container) {
            var $link = $container.find('a');

            $container.addClass('hover-zoom hover-zoom--zoom');
            $link.addClass('hover-zoom__container');

            $link.zoom({
                url: $link.attr('href'),
                lazyLoad: false
            });
        },

        attachMagnify = function($container) {
            var $link = $container.find('a');

            $container.addClass('hover-zoom hover-zoom--magnify');
            $link.addClass('hover-zoom__container');

            $link.magnify({
                url: $link.attr('href'),
                touchSupport: true
            });
        },

        detachPlugins = function($container) {
            $container
                .removeClass('hover-zoom--magnify hover-zoom--zoom')
                .find('a')
                .trigger('magnify.destroy')
                .trigger('zoom.destroy');
        },

        setup = function($container) {

            detachPlugins($container);

            if (WORKAREA.breakPoints.currentlyLessThan('medium')) {
                attachZoom($container);
            } else {
                attachMagnify($container);
            }
        },

        events = function($container) {
            $container.find('img').on('load', _.partial(setup, $container));
        },

        init = function($scope) {
            var $container = $(WORKAREA.config.hoverZooms.primaryImageContainer);

            setup($container);
            events($container);
        };

    return {
        init: init
    };
}()));
