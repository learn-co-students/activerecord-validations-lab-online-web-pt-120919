class TitleValidator < ActiveModel::Validator

  def validate(record)
    unless record.title =~ /(Won't Believe | Secret | Top \d | Guess)/
      record.errors[:title] << "Title not catchy enough"
    end
  end
end
