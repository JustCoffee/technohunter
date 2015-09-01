class AddSiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :site, :string
    add_column :users, :comp_name, :string
    add_column :users, :law_name, :string
    add_column :users, :law_address, :string
    add_column :users, :post_address, :string
    add_column :users, :inn, :string
    add_column :users, :fio_ruk, :string
    add_column :users, :fio_buch, :string
    add_column :users, :fio_main_person, :string
    add_column :users, :gor_tel_main, :string
    add_column :users, :mob_tel_main, :string
    add_column :users, :fio_dop_person, :string
    add_column :users, :email_dop, :string
    add_column :users, :gor_tel_dop, :string
    add_column :users, :mob_tel_dop, :string

    remove_column :users, :full_name
  end
end
