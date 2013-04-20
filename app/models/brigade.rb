class Brigade < ActiveRecord::Base
  attr_accessible :count_of_workers, :country_id, :price, :title, :job_ids, :job_list
  belongs_to :country
  has_and_belongs_to_many :jobs

  validates :title, :count_of_workers, :price, :country_id, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :count_of_workers, numericality: {greater_than: 0}
  validate :any_jobs?

  def job_list=(names)
  	names.split(',').each do |n|
  		self.jobs << Job.find_or_create_by_title(n.strip) if jobs.where(title: n.strip).empty?  		
  	end  	
  end

  def job_list
  	jobs.map(&:title).join(', ')  	
  end

  def any_jobs?
    if job_list.blank? && job_ids.blank?
      errors.add(:base, 'Brigade must have at least one job')
      return false
    else
      return true
    end
  end
end
