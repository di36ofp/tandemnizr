# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Dimi Mint Abba", "Julie Adams", "Red Allen", "Tori Amos", "Judith Anderson", "Keith Andes", "Fatty Arbuckle", "Gem Archer", "Kokomo Arnold", "Antonin Artaud", "Barry Atwater", "Patricia Avery", "Tex Avery", "Faith Bacon", "Buff Bagwell", "Benny Bailey", "Ginger Baker", "Ox Baker", "Johnny Ball", "Binnie Barnes", "Syd Barrett", "Count Basie", "Barney Bigard", "Acker Bilk", "Kelly Bishop", "Edith Bliss", "Sean Bonniwell", "Lucienne Boyer", "Alice Brady", "Beau Bridges", "John Bromfield", "Bruno Brookes", "Timothy Brown", "Sonny Burke", "T-Bone Burnett", "Jethro Burns", "Pat Buttram", "Don Byas", "Max Bygraves", "Zoe Caldwell", "Candy Candido", "David Carradine", "John Carradine", "Lon Chaney", "Sr., Lon Chaney Jr., Doc Cheatham", "Warren Clarke", "Buck Clayton", "Jaybird Coleman", "Betty Compson", "Betty Compton", "Heinie Conklin", "Chuck Connors", "Gary Conway", "Tim Conway", "Carole Cook", "Gary Cooper", "Jacqueline Courtney", "Donald Crisp", "John Cromwell", "Bing Crosby", "Scatman Crothers", "Shawn Daivari", "James D'Arcy", "Linda Darnell", "Bodjie Dasig", "Manna Dey", "B.B. Dickerson", "Mark Dinning", "Kenny Dino", "Claire Dodd", "Peter Donat", "Sunil Dutt", "Duke Ellington", "Lu Edmonds", "Honeyboy Edwards", "Anthony Eisley", "Duke Ellington", "Peg Entwistle", "Dixie Evans", "Madge Evans", "Tovah Feldshuh", "Pops Fernandez", "Virginia Field", "Fyvush Finkel", "Herbie Flowers", "Dick Foran", "Faith Ford", "Glenn Ford", "Anthony Forwood", "Panama Francis", "Alan Freed", "Mickey Freeman", "Ace Frehley", "France Gall", "Red Garland", "Hoot Gibson", "Dizzy Gillespie", "Tweety González", "Michael Gordon", "Lloyd Gough", "Charles Gray", "Timothy Gray", "Lorne Greene", "Clu Gulager", "Onaje Allan Gumbs", "Mick Guzauski", "Nina Hagen", "Pooch Hall", "Ram Hall", "Tubby Hall", "Oliver Hardy", "Damon Harris", "Jet Harris", "Hawkshaw Hawkins", "Screamin' Jay Hawkins", "Sessue Hayakawa", "Topper Headon", "Tippi Hedren", "Bobby The Brain Heenan", "Levon Helm", "Skitch Henderson", "Benny Hill", "Pat Hingle", "Bill Hinnant", "Junie Hoang", "Boscoe Holder", "Peanuts Holland", "Skip Homeier", "Nellee Hooper", "Bob Hope", "Jennifer Howard", "Season Hubley", "Peanuts Hucko", "Gareth Hughes", "Sean Hughes", "Gareth Hunt", "Chubby Jackson", "Ezekiel Jackson", "Jackie Jackson"].each do | user |
  email = user.downcase.gsub(/\s+/, "")+"@gmail.com"
  one_user = User.create(name: user,
                         email: email,
                         password: "Diego12*",
                         password_confirmation: "Diego12*")
  if email.size % 3 == 0
    lang = Language.create(language: 'fr',
                            user_id: one_user.id )
    lang = Language.create(language: 'es',
                            user_id: one_user.id )
    lang = Language.create(language: 'en',
                            user_id: one_user.id )
  elsif email.size % 2 == 0
    lang = Language.create(language: 'fr',
                            user_id: one_user.id )
    lang = Language.create(language: 'es',
                            user_id: one_user.id )
    lang = Language.create(language: 'en',
                            user_id: one_user.id )
    lang = Language.create(language: 'de',
                            user_id: one_user.id )
  elsif email.size % 5 == 0
    lang = Language.create(language: 'fr',
                            user_id: one_user.id )
    lang = Language.create(language: 'es',
                            user_id: one_user.id )
  else
    lang = Language.create(language: 'de',
                            user_id: one_user.id )
  end

end