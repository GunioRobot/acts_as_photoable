namespace :aap do
  desc 'Copies default  photos templates to app/views/shared'
  task :cp_photos_view do
    target_dir = File.join(RAILS_ROOT, 'app', 'views', 'shared')
    mkdir_p target_dir
    FileUtils.cp Dir.glob(File.join(File.dirname(__FILE__), '..', 'assets', 'views', '*.erb')), target_dir

    puts "cp the _upload_photo.html.erb to app/views/shared"
  end
end
