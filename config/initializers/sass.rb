Sass::Plugin.options.merge!(
  :template_location => 'public/css/sass',
  :css_location => 'tmp/css'
)

Rails.configuration.middleware.delete('Sass::Plugin::Rack')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/css'],
    :root => "#{Rails.root}/tmp")