class AddLastResultToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :last_result_id, :integer

    Page.find_each do |page|
      Page.update(last_result: page.results.order(created_at: :desc).first)
    end
  end
end
