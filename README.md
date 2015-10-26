# stroke-seven-rails [![Gem Version](http://img.shields.io/gem/v/stroke-seven-rails.svg)](https://rubygems.org/gems/stroke-seven-rails) [![Build Status](https://secure.travis-ci.org/bimovidia/stroke-seven-rails.svg)](http://travis-ci.org/bimovidia/stroke-seven-rails)

stroke-seven-rails provides the
[Stroke 7](http://www.pixeden.com/icon-fonts/stroke-7-icon-font-set) web fonts and
stylesheets as a Rails engine for use with the asset pipeline.

## Installation

Add this to your Gemfile:

```ruby
gem "stroke-seven-rails"
```

and run `bundle install`.

## Usage

In your `application.css`, include the css file:

```css
/*
 *= require stroke-seven
 */
```

Optionally, you can include `stroke-seven-helper` css file:

```css
/*
 *= require stroke-seven-helper
 */
```

**Important:** if you already use font-awesome (FA) icon font in your website, you might want to use the FA classes instead.

Then restart your webserver if it was previously running.

Congrats! You now have scalable vector icon support. Pick an icon and check out the
[StrokeSeven Examples](http://themes-pixeden.com/font-demos/7-stroke/index.html).

### Sass Support

If you prefer [SCSS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), add this to your
`application.css.scss` file:

```scss
@import "stroke-seven";
```

If you use the
[Sass indented syntax](http://sass-lang.com/docs/yardoc/file.INDENTED_SYNTAX.html),
add this to your `application.css.sass` file:

```sass
@import stroke-seven
```

### Helpers

There are also some helpers (`s7_icon`) that make your
views _icontastic!_

```ruby
s7_icon "album"
# => <i class="pe-s7-album"></i>

s7_icon "female", text: "Take a selfie"
# => <i class="pe-s7-female"></i> Take a selfie

content_tag(:li, s7_icon("male", text: "Bulleted list item"))
# => <li><i class="pe-s7-male"></i> Bulleted list item</li>
```

## Misc

### Rails engines

When building a Rails engine that includes stroke-seven-rails as a dependency,
be sure to `require "stroke-seven-rails"` somewhere during the intialization of
your engine. Otherwise, Rails will not automatically pick up the load path of
the stroke-seven-rails assets and helpers.

### Deploying to sub-folders

It is sometimes the case that deploying a Rails application to a production
environment requires the application to be hosted at a sub-folder on the server.
This may be the case, for example, if Apache HTTPD or Nginx is being used as a
front-end proxy server, with Rails handling only requests that come in to a sub-folder
such as `http://example.com/myrailsapp`. In this case, the
StrokeSeven gem (and other asset-serving engines) needs to know the sub-folder,
otherwise you can experience a problem roughly described as ["my app works
fine in development, but fails when I deploy
it"](https://github.com/bimovidia/stroke-seven-rails/issues/74).

To fix this, set the *relative URL root* for the application. In the
environment file for the deployed version of the app, for example
`config/environments/production.rb`,
set the config option `action_controller.relative_url_root`:

    MyApp::Application.configure do
      ...

      # set the relative root, because we're deploying to /myrailsapp
      config.action_controller.relative_url_root  = "/myrailsapp"

      ...
    end

The default value of this variable is taken from `ENV['RAILS_RELATIVE_URL_ROOT']`,
so configuring the environment to define `RAILS_RELATIVE_URL_ROOT` is an alternative strategy.

### Rails 3.2

**Note:** In Rails 3.2, make sure stroke-seven-rails is outside the bundler asset group
so that these helpers are automatically loaded in production environments.

## Versioning

Versioning follows the core releases of Stroke 7 which follows Semantic
Versioning 2.0 as defined at <http://semver.org>. We will do our best not to
make any breaking changes until Stroke 7 core makes a major version bump.

## License

* The [Stroke 7](http://www.pixeden.com/icon-fonts/stroke-7-icon-font-set) font is
  licensed under the [SIL Open Font License](http://scripts.sil.org/OFL).
* [Stroke 7](http://github.com/bimovidia/stroke-seven-rails) CSS files are
  licensed under the [MIT License](http://opensource.org/licenses/mit-license.html).
* The remainder of the stroke-seven-rails project is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
