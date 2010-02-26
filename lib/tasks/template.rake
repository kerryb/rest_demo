task :template do
  ENV['LOCATION'] = 'http://nimbus-git.nat.bt.com/projects/nimbus-rails-template/repos/mainline/blobs/raw/master/template.rb'
  Rake::Task[:'rails:template'].invoke
end
