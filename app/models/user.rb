# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  full_name       :string(255)
#  password        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#

class User < ActiveRecord::Base
  has_many :videos
  has_many :reviews, order: "created_at DESC"
  has_many :queue_items, order: :position
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id
  has_secure_password

  validates_presence_of :full_name, :password, :email
  validates_uniqueness_of :email

    def normalize_queue_item_positions
      queue_items.each_with_index do |queue_item, index|
        queue_item.update_attributes(position: index+1)
      end
    end

    def queued_video?(video)
      queue_items.map(&:video).include?(video)
    end
end
