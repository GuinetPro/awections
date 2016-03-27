class Auction < ActiveRecord::Base
  belongs_to :product
  has_many :bids

  def top_bid
    bids.order(value: :desc).first
  end

  def current_bid
    top_bid.nil? ? value : top_bid.value
  end

  def ended?
    ends_at < Time.now
  end


  def check_ended product_id
    if self.ends_at.nil?
      self.ends.at = Time.now
      self.save
     end
  end

end
