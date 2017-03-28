module RandomData
  def self.random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end

  def self.random_paragraph
    sentances = []
    rand(4..6).times do
      sentances << random_sentance
    end

    sentances.join(" ")
  end

  def self.random_sentance
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentance = strings.join(" ")
    sentance.capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
