# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


require Rails.root.join('db', 'seeds', 'support', 'group_seeder')

seeder = GroupSeeder.new

root = Group.roots.first
srand(42)

if root.address.blank?
  root.update_attributes(seeder.group_attributes)
  root.default_children.each do |child_class|
    child_class.first.update_attributes(seeder.group_attributes)
  end
end

Group::Unassigned.seed(:name, :parent_id,
  {
    name: 'Neuanmeldungen',
    address: "Mühlendamm 3",
    zip_code: "10178",
    town: "Berlin",
    country: "DE",
    email: "unassigned@europeanjamboree.de",
    parent_id: root.id
  }
)

Group::UnitSupport.seed(:name, :parent_id,
  {
    name: 'Unit Betreuer',
    address: "Mühlendamm 3",
    zip_code: "10178",
    town: "Berlin",
    country: "DE",
    email: "ub@europeanjamboree.de",
    parent_id: root.id
  }
)

unit_support = Group.find_by_name('Unit Betreuer')
Group::Unit.seed(:name, :parent_id,
  {
    name: 'Unit Franken',
    address: "Äußere Bayreuther Straße 1234",
    zip_code: "90411",
    town: "Nürnberg",
    country: "DE",
    email: "unit-franken@europeanjamboree.de",
    parent_id: unit_support.id
  },
  {
    name: 'Unit Hamburg',
    address: "Reeperbahn 63",
    zip_code: "20359",
    town: "Hamburg",
    country: "DE",
    email: "unit-hamburg@europeanjamboree.de",
    parent_id: unit_support.id
  }
)

Group::InternationalServiceTeam.seed(:name, :parent_id,
  {
    name: 'International Service Team',
    address: "Mühlendamm 3",
    zip_code: "10178",
    town: "Berlin",
    country: "DE",
    email: "ist@europeanjamboree.de",
    parent_id: root.id
  }
)


Group.rebuild!
