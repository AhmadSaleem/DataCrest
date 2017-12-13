# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wholesaler_owner = Salesperson.new(
     first_name: 'Jim',
     last_name: 'McGuire',
     email: 'jim-mcguire@phly.com',
     password: 'password',
     password_confirmation: 'password',
     profile_picture: open(Rails.root.to_s + '/db/users/jim-mcguire.jpg'),
)
wholesaler_owner.save(validate: false)

wholesaler = Wholesaler.new(
    title: 'PHLY Insurance Companies',
    address_1: '231 St Asaphs Rd',
    address_2: '',
    city: 'Bala Cynwyd',
    state: 'PA',
    zip_code: '19004',
    website: 'www.phlyinsurance.com',
    owner_id: wholesaler_owner.id,
    logo: open(Rails.root.to_s + '/app/assets/images/site-logo.jpg'),
)
wholesaler.save

wholesaler_owner.wholesaler_id = wholesaler.id
wholesaler_owner.save


Salesperson.create([
                {first_name: 'Colin',
                 last_name: 'Ambler',
                 email: 'colinambler@me.com',
                 password: 'password',
                 password_confirmation: 'password',
                 profile_picture: open(Rails.root.to_s + '/db/users/colin.jpg'),
                },

                {first_name: 'Jack',
                 last_name: 'McGuire',
                 email: 'jack-mcguire@phly.com',
                 password: 'password',
                 password_confirmation: 'password',
                 profile_picture: open(Rails.root.to_s + '/db/users/jack-mcguire.jpg'),
                 wholesaler_id: wholesaler.id,
                },

                {first_name: 'Rob',
                 last_name: 'Watts',
                 email: 'rob-watts@phly.com',
                 password: 'password',
                 password_confirmation: 'password',
                 profile_picture: open(Rails.root.to_s + '/db/users/rob-watts.jpg'),
                 wholesaler_id: wholesaler.id,
                }
            ])

puts 'all employees accept invitation'

wholesaler.salespeople.each do |user|
  user.accept_invitation!
  user.save
end

puts 'give company application templates'
class_name = 'JimcorDwellingApplication'
wholesaler.templates.create([
  {class_name: class_name, title: 'Human Services Application'},
  {class_name: class_name, title: 'Commercial Auto'},
  {class_name: class_name, title: 'Cyber Security'},
  {class_name: class_name, title: 'Environmental'},
  {class_name: class_name, title: 'Real Estate'},
])


########


agency_owner = Agent.new(
    first_name: 'Tom',
    last_name: 'Young',
    email: 'ty@agency.com',
    password: 'password',
    password_confirmation: 'password',
    agent_code: '1827123',
    profile_picture: open(Rails.root.to_s + '/db/users/tom-young.jpg'),
)
agency_owner.save(validate: false)

agency = Agency.new(
    title: 'Lockton Companies',
    address_1: '1800 John F Kennedy Blvd',
    address_2: '#1110',
    city: 'Philadelphia',
    state: 'PA',
    zip_code: '19103',
    website: 'http://www.lockton.com/',
    owner_id: agency_owner.id,
    logo: open(Rails.root.to_s + '/db/companies/lockton.jpg'),
)

agency.save

agency_owner.agency_id = agency.id
agency_owner.save

AgentWholesaler.create!(agent_id: agency_owner.id, wholesaler_id: wholesaler.id, status: 1)