class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) }
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where("cat_id = ?", self.cat_id).where('id != ?', self.id)
      .where("start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?", self.start_date, self.end_date, self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    self.overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if self.overlapping_approved_requests.exists?
      self.errors[:overlap] << 'Pre-existing approved request overlaps with the dates you requested'
    end
  end

  def overlapping_pending_requests
    self.overlapping_requests.where(status: 'PENDING')
  end

  def approve!
    CatRentalRequest.transaction do
      overlapping_pending_requests.each do |request|
        request.update!(status: 'DENIED')
      end
      self.update!(status: 'APPROVED')
    end
  end

  def deny!
    self.update!(status:'DENIED')
  end


end
