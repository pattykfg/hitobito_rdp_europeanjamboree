# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
  module PeopleController
    extend ActiveSupport::Concern
    included do
      self.permitted_attrs += [:old_id,
        :rdp_association,
        :rdp_association_region,
        :rdp_association_sub_region,
        :rdp_association_group,
        :rdp_association_number,
        :role,
        :tour,
        :sepa_name,
        :sepa_address,
        :sepa_zip_code,
        :sepa_town,
        :sepa_iban,    
        :registration_pdf_path,
        :registration_locked,
        :registration_print_date,
        :sepa_signature, 
        :sepa_date, 
        :contract_signature, 
        :media_agreement, 
        :registration_accepted_date,     
        :payment_problem,
        :payment_recieved   
      ]
      # Overide edit to fill association tree
      # Display a form to edit an exisiting entry of this model.
      #   GET /entries/1/edit
      def edit(&block)
        @association_tree = Settings.association_tree
        @possible_tour = ""
        # TODO must be a better way to select from settings.yml
        if :role == Settings.person.role.ul or :role == Settings.person.role.ut
            Settings.tour.each { |tour|
                tour[1].to_s == @person.tour ? selected = "selected='selected'" : selected = ""
                @possible_tour += "<option id='" + tour[0].to_s + "' " + selected + " >" + tour[1].to_s + "</option>"
            }  
        else 
            Settings.no_tour.each { |tour|
                tour[1].to_s == @person.tour ? selected = "selected='selected'" : selected = ""
                @possible_tour += "<option id='" + tour[0].to_s + "' " + selected + " >" + tour[1].to_s + "</option>"
            }  
            Rails.logger.debug("====> " + @possible_tour)

        end 
        respond_with(entry, &block)
      end
     end
  end
end