class AddSocialNetworkLinkToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :social_network_link, :string
  end
end
