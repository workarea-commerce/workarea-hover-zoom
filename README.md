Workarea Hover Zoom
================================================================================

Hover Zoom plugin for the Workarea commerce platform adds zoom capabilities (desktop/mobile) on your product primary images.


Setup
--------------------------------------------------------------------------------

#### New Build

This plugin is intended to be fairly automatic and will work out of the box if you are making a new build.

The only thing you will have to do is to remove the `data-dialog-button` attached to the container `.product-details__primary-image` in `workarea/storefront/products/templates/_generic.html.haml`.

In the Workarea platform we call that ["Overriding a View"](https://developer.workarea.com/workarea-3/guides/override-a-view).

#### Custom Build

If you are not creating a new build and you have already made some customisation on it, we will have to dig a bit.

The plugin assumes the container ```.product-details__primary-image``` exists _(this can be tweaked in the configuration)_ and contains the following tags: ```<a>```, ```<img>```.

Example markup:

```html
<div class="product-details__primary-image">
    <!-- /zoom.jpg is the asset used by the plugin as the zoom image -->
    <a href="/zoom.jpg">
        <img class="product-details__primary-image-link-image" src="/detail.jpg">
    </a>
</div>
```

Example markup after initialization of the plugin:

```html
<div class="product-details__primary-image">
   <!-- Link used as a container -->
    <a class="hover-zoom__container" href="/zoom.jpg" style="overflow: hidden;">
        <img src="/detail.jpg">

        <!-- Zoom image added -->
        <img src="/zoom.jpg" role="presentation" style="opacity: 0; top: -219.917px; left: -136.677px; position: absolute; width: 670px; height: 1006px; border: none; max-width: none; max-height: none;">
        </a>
</div>
```

Configuration
--------------------------------------------------------------------------------

If any of this configuration needs adjustment, feel free to make changes in your project-specific storefront config file. Your project's config file should be loaded after the "Configuration" section of the manifest:

```
// application.js.erb manifest

...

# Configuration
%w(
  workarea/core/config
  workarea/storefront/config
).each do |asset|
  require_asset asset
end

# Project Specific Configuration
require_asset 'workarea/storefront/my_project_config'

...

```

And you should override and modify the hover-zoom configuration in your Project's Config file, as needed:

```
// in my_project_config.js

...

WORKAREA.config.hoverZooms = {
    primaryImageContainer: '.selector'
};

...

```

##### Available configuration variables

| Variable  | Description | Default
| ------------- | ------------- | ------------- |
| primaryImageContainer  | The container where the zoom system will be initialized  | .product-details__primary-image |


Advanced
--------------------------------------------------------------------------------

This plugin is acting as an orchestrator of two jQuery plugins:
- [workarea-jquery-zoom](https://stash.tools.weblinc.com/projects/WP/repos/workarea-jquery-zoom/browse)
- [workarea-jquery-magnify](https://stash.tools.weblinc.com/projects/WP/repos/workarea-jquery-magnify/browse)

Therefore if you need more flexibility you can come up with your own solution without re-inventing the wheel.

Getting Started
--------------------------------------------------------------------------------

This gem contains a Rails engine that must be mounted onto a host Rails application.

Then add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-hover_zoom'
    # ...

Update your application's bundle.

    cd path/to/application
    bundle


Workarea Platform Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea platform documentation.

License
--------------------------------------------------------------------------------

Workarea Hover Zoom is released under the [Business Software License](LICENSE)
