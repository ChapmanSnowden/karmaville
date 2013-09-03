class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  before_create :add_karma
  before_destroy :remove_karma
  before_save :modify_karma

  def add_karma
    self.user.total_karma += value
    self.user.save
  end

  def remove_karma
    self.user.total_karma -= value
    self.user.save
  end

  def modify_karma
    if (KarmaPoint.find(id) rescue nil)
      unless KarmaPoint.find(id).value == value
        self.user.total_karma = user.total_karma - KarmaPoint.find(id).value + value
        self.user.save
      end
    end
  end  
end
