class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles, id: false do |t|
      t.belongs_to :figure
      t.belongs_to :title
    end
  end
end
