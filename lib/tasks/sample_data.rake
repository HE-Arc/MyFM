require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke 
    make_bands
    make_users
    make_posts_user
    make_posts_band
    make_bandrelations
  end
end

def make_bands
  10.times do |n|
    name = "band-#{n+1}"
    bio = Faker::Lorem.sentence(5)
    Band.create!(:name => name, :bio => bio)
  end
end

def make_users
  99.times do |n|
    name = Faker::Name.last_name
    firstname = Faker::Name.first_name
    email = "example-#{n+1}@myfm.org"
    password = "1234"
    borndate = "2011-11-30"
    User.create(:name => name,:email=>email,:password => password, :firstname => firstname, :borndate => borndate)
  end
end

def make_posts_user
  User.all(:limit => 6).each do |user|
    50.times do
      user.posts.create!(:content => Faker::Lorem.sentence(5))
    end
  end
end

def make_posts_band
  Band.all(:limit => 6).each do |band|
    50.times do
      band.posts.create!(:content => Faker::Lorem.sentence(5))
    end
  end
end

def make_bandrelations
  users = User.all
  bands = Band.all
  user = users.first
  bandtojoin = bands[1..5]
  bandtojoin.each {|band| user.joinband(band)}
end