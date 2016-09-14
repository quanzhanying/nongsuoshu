class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  has_many :favorites_relationships
  has_many :favorite_books, through: :favorites_relationships, source: :book

  def has_added_to_favorites?(book)
    favorite_books.include?(book)
  end

  def add_to_favorites!(book)
    favorite_books << book
  end

  def remove_favorites!(book)
    favorite_books.delete(book)
  end

  def admin?
    is_admin
  end

  def paid?
    is_paid
  end

  def valid_subscriber?
    expired_at && expired_at > Time.zone.now
  end

  def add_subscription_date!(plan_date)
    begin_date =
      if expired_at && expired_at > Time.zone.now
        expired_at
      else
        Time.zone.now
      end
    self.expired_at = begin_date + plan_date.days
    save
  end
end


# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :true
#  user_name              :string
#  expired_at             :datetime
#  is_paid                :boolean
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
