# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class RdpEuropeanjamboreePersonSeeder < PersonSeeder


  def seed_demo_person(first, last, group, role_type)
    attrs = { email: first.downcase + "." + last.strip.downcase + "@europeanjamboree.de",
              first_name: first,
              last_name: last}

    return seed_demo_person_with_attrs(attrs, group, role_type)
  end

  def seed_demo_person_with_attrs(attrs, group, role_type)

    Person.seed_once(:email, attrs)
    person = Person.find_by_email(attrs[:email])

    role_attrs = { person_id: person.id, group_id: group.id, type: role_type.sti_name }
    Role.seed_once(*role_attrs.keys, role_attrs)

    return person
  end

end

seeder = RdpEuropeanjamboreePersonSeeder.new

seeder.seed_all_roles

root = Group.root

peter_attrs = { email: "peter.neubauer@europeanjamboree.de",
  first_name: "Peter",
  last_name: "Neubauer",
  encrypted_password: BCrypt::Password.create("jamb2021", cost: 1)
}
seeder.seed_demo_person_with_attrs(peter_attrs, root, Group::Root::Administrator)

seeder.seed_demo_person("Anja", "Administrator", root, Group::Root::Administrator)
seeder.seed_demo_person("Karl", "Kontingentsleitung", root, Group::Root::Head)
seeder.seed_demo_person("Vera", "Verwaltung", root, Group::Root::Registration)
seeder.seed_demo_person("Fritz", "Finanzer", root, Group::Root::Finance)

