class AddPeopleAttrs < ActiveRecord::Migration[4.2]
    def change
      add_column :people, :old_id, :string
      add_column :people, :rdp_association, :string
      add_column :people, :rdp_association_region, :string
      add_column :people, :rdp_association_sub_region, :string
      add_column :people, :rdp_association_group, :string
      add_column :people, :rdp_association_number, :string

      add_column :people, :role, :string
      add_column :people, :tour, :string
      
      add_column :people, :sepa_name, :string
      add_column :people, :sepa_address, :string
      add_column :people, :sepa_zip_code, :string
      add_column :people, :sepa_town, :string
      add_column :people, :sepa_iban, :string    

      add_column :people, :registration_pdf_path, :string
      add_column :people, :registration_locked, :boolean
      add_column :people, :registration_print_date, :date
      add_column :people, :sepa_signature, :boolean 
      add_column :people, :sepa_date, :date 
      add_column :people, :contract_signature, :boolean 
      add_column :people, :media_agreement, :boolean 
      add_column :people, :registration_accepted_date, :date
            
      add_column :people, :payment_problem, :boolean
      add_column :people, :sepa_first, :boolean    
      add_column :people, :sepa_second, :boolean    
      add_column :people, :sepa_third, :boolean    
      add_column :people, :sepa_comment, :boolean    
      add_column :people, :payment_recieved, :boolean    

      add_column :people, :old_phone, :string

    end
end