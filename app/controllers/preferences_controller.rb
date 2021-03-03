class PreferencesController < ApplicationController

  def matches
    # Eliseu: just an idea for a first criteria definition:
    # match_country = current_user.country
    # match_genre = current_user.medium.genre  # Eliseu: not sure about syntax

    # @matches = User.where(country: match_country).or(User.where(genre: match_genre))
    # Eliseu: Not sure about this - still needs validation from a TA

    @matches = User.all
  end

end
