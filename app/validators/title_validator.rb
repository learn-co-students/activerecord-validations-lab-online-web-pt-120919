class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      unless record.title.match?(/Won't Believe | Secret | Top [number]/)
        record.errors[:title] << "Must include these phrases"
      end
    end 
  end
end
