class Script < ActiveRecord::Base
  # SCHEDULES AVAILABLE CONFIGURATIONS
  SCHEDULES = [:not_scheduled, :every_hour]

  validates :name, presence: true
  validates :content, presence: true

  before_create :randomize_id

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Script.where(id: self.id).exists?
  end
end
