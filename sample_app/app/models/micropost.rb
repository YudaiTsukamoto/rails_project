class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order('id DESC')}
  validates :user_id,presence:true
  validates :content,presence:true,length:{maximum:140}


 def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
        WHERE follower_id = :user_id
        AND relationships.followed_id = microposts.user_id"
    where("EXISTS (#{followed_user_ids})
    OR user_id = :user_id",
    user_id: user.id)
  end


  # def self.from_users_followed_by(user)
  #   followed_user_ids = user.followed_user_ids
  #   where("user_id IN (?,?)",
  #                     followed_user_ids, user)
  # end


  # def self.from_users_followed_by(user)
  #   followed_user_ids = "SELECT followed_id FROM relationships
  #       WHERE follower_id = :user_id"
  #   where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
  #         user_id: user.id)
  # end

  # def self.from_users_followed_by(user)
  #   find_by_sql(['
  #                SELECT *
  #                FROM microposts m
  #                JOIN (
  #                SELECT m2.id FROM microposts m2
  #                JOIN relationships r ON r.followed_id = m2.user_id
  #                AND r.follower_id = ?
  #                ) AS m1
  #                ON m1.id = m.id',user])
  # end
end
