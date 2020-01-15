class Person < ApplicationRecord
    validates :name, :house_id, presence: true

    belongs_to :house,
    foreign_key: :house_id, 
    class_name: "House"

end
