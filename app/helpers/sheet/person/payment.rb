module Sheet
    class Person < Base
      class Payment < Base
  
        self.parent_sheet = Sheet::Person
  
      end
    end
  end