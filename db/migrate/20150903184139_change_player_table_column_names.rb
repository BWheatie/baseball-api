class ChangePlayerTableColumnNames < ActiveRecord::Migration
  def change
    rename_column :players, :birthYear, :birth_year
    rename_column :players, :birthMonth, :birth_month
    rename_column :players, :birthDay, :birth_day
    rename_column :players, :birthCountry, :birth_country
    rename_column :players, :birthState, :birth_state
    rename_column :players, :birthCity, :birth_city
    rename_column :players, :deathYear, :death_year
    rename_column :players, :deathMonth, :death_month
    rename_column :players, :deathDay, :death_day
    rename_column :players, :deathCountry, :death_country
    rename_column :players, :deathState, :death_state
    rename_column :players, :deathCity, :death_city
    rename_column :players, :nameFirst, :name_first
    rename_column :players, :nameLast, :name_last
    rename_column :players, :nameGiven, :name_given
    rename_column :players, :finalGame, :final_game
  end
end
