class Company < ApplicationRecord
  has_rich_text :description

  validate :valid_email
  validates :zip_code, presence: true

  before_save :fill_address, if: ->(obj) { obj.zip_code_changed? }

  private

  def valid_email
    unless email.blank? || email.end_with?('@getmainstreet.com')
      errors.add(:email, 'domain allow only `getmainstreet.com` ')
    end
  end

  def fill_address
    info = ZipCodes.identify(zip_code)

    if info.nil?
      errors.add(:zip_code, 'invalid')
      raise ActiveRecord::RecordInvalid, self
    end

    self.state = info[:state_name]
    self.city = info[:city]
  end
end
