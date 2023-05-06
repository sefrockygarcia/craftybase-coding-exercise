class StudentHomework < ApplicationRecord
  belongs_to :student, class_name: User.name
  belongs_to :homework
  has_one_attached :attachment
  validate :acceptable_attachment

  scope :by_grade, ->(grade) {
    where(grade: grade)
  }

  scope :by_title, ->(title) {
    joins(:homework)
    .where('homeworks.title LIKE ?', "%#{title}%")
  }

  private

  def acceptable_attachment
    return unless attachment.attached?

    acceptable_types = ['image/jpeg', 'application/pdf']
    unless acceptable_types.include?(attachment.content_type)
      errors.add(:attachment, 'must be a JPEG image or a PDF document')
    end
  end
end
