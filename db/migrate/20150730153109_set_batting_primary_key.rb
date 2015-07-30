class SetBattingPrimaryKey < ActiveRecord::Migration
  def change
    execute 'ALTER TABLE "Batting" DROP CONSTRAINT "Batting_pkey";'
    execute 'ALTER TABLE "Batting" ADD UNIQUE (id);'
    execute 'ALTER TABLE "Batting" ADD PRIMARY KEY (id);'
  end
end
