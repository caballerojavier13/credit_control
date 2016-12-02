
case Rails.env

  when "development"

    User.new(
        :name=> "Javier Hernán Caballero Garcia",
        :email=> "caballerojavier13@gmail.com",
        :password => "36416999",
        :password_confirmation =>"36416999"
    ).save!

    Person.create(name: 'Gisela')

    Person.create(name: 'María')

  when "production"

end