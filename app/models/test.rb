# frozen_string_literal: true

class Test < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :questions
  belongs_to :category
  def self.all_tests_by_category(category)
    joins('INNER JOIN categories on tests.category_id = category_id').where(categories: { name: category })
                                                                     .order(id: :decs)
                                                                     .pluck(:name)
  end
end
