User.destroy_all
Walker.destroy_all
Walk.destroy_all
User.reset_pk_sequence
Walker.reset_pk_sequence
Walk.reset_pk_sequence

def create_user
    user = User.create(
        username: Faker::TvShows::ParksAndRec.character,
        dog_name: Faker::Creature::Dog.name,
        dog_age: rand(0...15),
        breed: Faker::Creature::Dog.breed,
        likes_walks: [true, false].sample 
    )
end

def create_walker
    walker = Walker.create(
        walker_name: Faker::Games::Pokemon.name
    )
end

def create_walk(user, walker)
    walks_number = rand(1..4)
    walks_number.times do 
        Walk.create(
            walk_appt: Faker::Time.between(from: DateTime.now + 2, to: DateTime.now),
            user_id: User.all.sample.id, 
            walker_id: Walker.all.sample.id
        )
    end
end

10.times do     
    create_walk(create_user, create_walker)
end


puts "🌱🌱🌱"