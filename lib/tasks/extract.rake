require 'etc'
require 'sequel'
require 'yaml'

task extract: :environment do

  user = Etc.getlogin

  credentials = File.open(File.join(Dir.home(user),'credentials.yaml')) {|y| YAML::load(y)}

  PR = Sequel.postgres(:database => 'projectlog', 
                       :host => 'thetford.kbs.msu.edu',
                       :user=> credentials['username'],
                       :password  => credentials['password'])

  DB = Sequel.sqlite(database: "db/projectlog2_development")
  entries = DB[:entries]
  tags = PR[:tags]
  tags_articles = PR[:articles_tags]

  table = PR[:contents]
  i = 0
  table.each do |row|
    p row[:author], row[:title], row[:body], row[:created_at]
    entry = Entry.create(date: row[:created_at], author: row[:author], note: row[:body])
    ids = tags_articles.where("article_id = ?", row[:id]).all
    transfer_tags = tags.where("id in ?",ids.map {|x| x[:tag_id]}).all
    new_tags = transfer_tags.map {|x| x[:name]} 
    entry.category_list.add new_tags
    entry.save
    i += 1
    break if i > 100
  end

end
