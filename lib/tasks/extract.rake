require 'etc'
require 'sequel'
require 'yaml'

task extract: :environment do

  user = Etc.getlogin

  credentials = File.open(File.join(Dir.home(user),'credentials.yaml')) {|y| YAML::load(y)}

  PR = Sequel.postgres(database: 'projectlog', 
                       # host: 'thetford.kbs.msu.edu',
                       host: '127.0.0.1',
                       port: 5430,
                       user: credentials['username'],
                       password: credentials['password'])

  tags = PR[:tags]
  tags_articles = PR[:articles_tags]

  table = PR[:contents]
  table.each do |row|
    p [row[:author], row[:title], row[:body], row[:created_at]]
    note = "#{row[:body]}\n\n#{row[:title]}"
    entry = Entry.create(date: row[:created_at], author: row[:author], note: note, created_at: row[:created_at],
                        updated_at: row[:updated_at])
    ids = tags_articles.where("article_id = ?", row[:id]).all
    transfer_tags = tags.where("id in ?",ids.map {|x| x[:tag_id]}).all
    new_tags = transfer_tags.map {|x| x[:name].gsub(/ /,'-')} 
    entry.category_list.add new_tags
    entry.save
  end

end
