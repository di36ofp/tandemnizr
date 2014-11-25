# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[ "Shohreh Aghdashloo", "Karen Akers", "Jane Alexander", "Alicia Alonso", "Jules Asner", "Pernilla August", "Tisha Terrasini Banker", "Glynis Barber", "Daniel Barnz", "Joy Behar", "Pat Benatar", "Jodi Benson", "Carla Bley", "Lynn Borden", "Angela Bowie", "Katie Boyle", "Dee Dee Bridgewater", "Ellen Burstyn", "L. Scott Caldwell", "Carlos Mencia", "Michele Mercier", "Tita Merello", "Bubber Miley", "Jason Miller", "Jody Miller", "Vincente Minnelli", "Julie Mitchum", "Robert Montgomery", "Clayton Moore", "Pee Wee Moore"].each do | user |
  email = user.downcase.gsub(/\s+/, "")+"@gmail.com"
  one_user = User.create(name: user,
                         email: email,
                         password: "Diego12*",
                         password_confirmation: "Diego12*")
  if email.size % 3 == 0
    lang = Language.create(language: 'french',
                            user_id: one_user.id )
    lang = Language.create(language: 'spanish',
                            user_id: one_user.id )
    lang = Language.create(language: 'english',
                            user_id: one_user.id )
  elsif email.size % 2 == 0
    lang = Language.create(language: 'french',
                            user_id: one_user.id )
    lang = Language.create(language: 'spanish',
                            user_id: one_user.id )
    lang = Language.create(language: 'english',
                            user_id: one_user.id )
    lang = Language.create(language: 'german',
                            user_id: one_user.id )
  elsif email.size % 5 == 0
    lang = Language.create(language: 'french',
                            user_id: one_user.id )
    lang = Language.create(language: 'spanish',
                            user_id: one_user.id )
  end

end