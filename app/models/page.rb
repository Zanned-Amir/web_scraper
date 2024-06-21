class Page < ApplicationRecord
  belongs_to :last_result, class_name: "Result"
  has_many :results
  validates :url, presence: true
  validates :check_type , presence: true
  validates :selector , presence: true
  validates :match_text , presence: {if: -> {check_type == 'text'}}
  validates :name , presence: true

  def run_and_notify!
    run_check!
    last_result.notify
  end

  def  run_check!
    scraper = Scraper.new(url)
    result= case  check_type
    when  "text"
      scraper.text(selector: selector).downcase == match_text.downcase

    when "exists"
      scraper.present?(selector: selector)

    when "not_exists"
      !scraper.present?(selector: selector)
    end
    new_result = results.create(success: result)
    update(last_result: new_result)
  end

end
