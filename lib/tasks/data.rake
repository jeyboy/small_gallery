namespace :data do
  desc 'build_data_from_assets'
  task :add_content => :environment do
    Picture.destroy_all
    path = Rails.root.to_s+"/app/assets/images/"
    folders = Dir.new(path).entries.select {|entry| File.directory?(path + entry) && entry != '..' && entry != '.' }

    folders.each do |folder|
      pict_category = PictureCategory.find_or_initialize_by_title(folder)
      Dir[path + folder + '/*'].entries.each do |entry|
        pict_category.pictures.build(:picture => File.open(entry))
        pict_category.save
      end
    end
  end
end
