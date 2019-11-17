# frozen_string_literal: true
class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  
  scope :easy, -> {where(level: 0..1)}
  scope :intermediate, -> {where(level: 2..4)}
  scope :hard, -> {where(level:5..Float::INFINITY)}
  scope :all_tests_by_category, -> (category) {Test.joins(:category).where categories: {name:category}}
  
  validates :level, numericality: {only_fixnum: true}
  validates :title, uniqueness: { scope: :level, message: 'uniqueness error' }
  validates :title, presence: true    
end
