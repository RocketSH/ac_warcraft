class UserInstance < ApplicationRecord
  belongs_to :user, counter_cache: :instances_count
  belongs_to :instance
  has_one :mission, through: :instance

  scope :find_by_followings, ->(user){
    where('user_id IN (?)', user.followings.map{|following| following.id})
  } 
end
