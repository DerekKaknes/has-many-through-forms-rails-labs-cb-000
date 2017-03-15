class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :rejections

  def display
    username = user ? user.username : "Guest"
    "#{username} says: #{content}"
  end

  private
  def rejections(attributes)
    attributes["username"].blank?
  end

end
