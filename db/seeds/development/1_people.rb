# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class RdpEuropeanjamboreePersonSeeder < PersonSeeder

  def amount(role_type)
    case role_type.name.demodulize
    when 'Member' then 5
    else 1
    end
  end

end

puzzlers = ['Pascal Zumkehr',
            'Pierre Fritsch',
            'Andreas Maierhofer',
            'Mathis Hofer',
            'Andre Kunz',
            'Pascal Simon',
            'Roland Studer']

devs = {'Customer Name' => 'customer@email.com'}
puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase}@puzzle.ch"
end

seeder = RdpEuropeanjamboreePersonSeeder.new

seeder.seed_all_roles

root = Group.root
devs.each do |name, email|
  seeder.seed_developer(name, email, root, Group::Root::Leader)
end
