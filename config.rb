###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :i18n, :mount_at_root => false 

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch = 'gh-pages'
end

activate :sync do |sync|
  # 利用するストレージプロバイダの識別子。S3を利用する場合は`AWS`
  sync.fog_provider = 'AWS'

  # アップロード先となるS3 Bucketの名前
  sync.fog_directory = 'www.smartuniverse.jp'

  # AWSリージョンの識別子。東京リージョンの場合は`ap-northeast-1`
  sync.fog_region = 'ap-northeast-1'

  # AWSアクセスキー
  sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']

  # アップロード時に既存ファイルを削除するかどうか。`delete`または`keep`
  sync.existing_remote_files = 'keep'

  # ファイルをgzip圧縮したもので置き換えるかどうか。`true`または`false`
  sync.gzip_compression = true

  # Middlemanのビルド完了後に自動で同期を行うかどうか。`true`または`false`
  # デフォルトでは行う（`true`）
  sync.after_build = false
end
