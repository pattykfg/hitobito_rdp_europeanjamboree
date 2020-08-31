# encoding: utf-8

class Group::UnitSupport < ::Group

  ### ROLES

  class Member < ::Role
    self.permissions = [:group_other_roles_and_below_full]
  end

  roles Member

end
