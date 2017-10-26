class Application < ApplicationRecord
  has_many :jimcor_dwelling_applications

  belongs_to :wholesaler
end
