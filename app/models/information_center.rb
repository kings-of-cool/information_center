class InformationCenter < ApplicationRecord
  before_create :confirm_singularity
  validates :name, presence: true
  validates :tel, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }

  private

  def confirm_singularity
    raise Exception.new(I18n.t("errors.messages.exist_already")) if InformationCenter.count > 0
  end
end
