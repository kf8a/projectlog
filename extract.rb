require 'etc'
require 'sequel'
require 'yaml'

user = Etc.getlogin

credentials = File.open(File.join(Dir.home(user),'credentials.yaml')) {|y| YAML::load(y)}

PR = Sequel.postgres(:database => 'projectlog', 
                     :host => 'thetford.kbs.msu.edu',
                     :user=> credentials['username'],
                     :password  => credentials['password'])

DB = Sequel.sqlite(database: "db/projectlog2_development")
entries = DB[:entries]
tags = PR[:tags]
tags_articles = PR[:tags_articles]

table = PR[:contents]
table.each do |row|
  p row[:author], row[:title], row[:body], row[:created_at]
  entries.insert datetime: row[:created_at], author: row[:author],
    note: row[:body]

end

