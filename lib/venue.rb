class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands

  validates :name, presence: true, uniqueness: true

  before_validation(:capitalize_name)


  private

   define_method(:capitalize_name) do
     unless self.name == nil
       words = self.name.split(" ")
       words.each do |word|
         word.capitalize!
       end
       self.name = words.join(" ")
     end
   end
end
