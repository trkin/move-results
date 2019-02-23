Rake::Task['db:fixtures:load'].invoke
# https://github.com/rails/rails/blob/master/activerecord/lib/active_record/fixtures.rb
# change underscore with human version
already_proccessed = []
Dir.entries("#{Rails.root}/test/fixtures").each do |file_name|
  next unless file_name[-4..-1] == '.yml'

  # foreach will read line by line
  File.foreach("#{Rails.root}/test/fixtures/#{file_name}").grep /LABEL/ do |line|
    column = line.match(/(\w*):.*\$LABEL/)[1]
    klass = file_name[0..-5].singularize.camelize
    next if already_proccessed.include? "#{klass}-#{column}"

    # puts "klass=#{klass} column=#{column}"
    klass.constantize.find_each do |item|
      next unless item.respond_to? "#{column}="

      item.send "#{column}=", item.send(column).humanize
      item.save # email can not be saved with spaces
    end
    already_proccessed.append "#{klass}-#{column}"
  end
end
puts Activity.all.map &:name
puts 'db:seed and db:fixtures:load completed'
