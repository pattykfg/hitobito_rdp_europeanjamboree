# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree::PersonSerializer
    extend ActiveSupport::Concern
    included do
      extension(:details) do |_|
        map_properties :old_id, :rdp_association, :rdp_association_region, :rdp_association_group, :rdp_association_number, :role, :tour, :sepa_name, :sepa_address, :sepa_zip_code, :sepa_town, :sepa_iban
      end
    end
  end