class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title, :state

  validates_presence_of :author
  validates_presence_of :content
  validates_presence_of :title
  validates_presence_of :state

  state_machine initial: :drafted do
    event :publish do
      transition :drafted => :published
    end

    event :retract do
      transition :published => :drafted,
        if: lambda { |post| post.id % 2 == 0 }
    end

    state :published do
      def favorite_thing_to_say
        "HELLO JASON, IM PUBLISHED"
      end
    end

    state :drafted do
      def favorite_thing_to_say
        "hi ERIC, just a draft"
      end
    end
  end

  class << self
    def published
      where(state: 'published')
    end
  end
end
