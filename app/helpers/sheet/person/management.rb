module Sheet
    class Person < Base
      class Management < Base
  
        self.parent_sheet = Sheet::Person
  
      end
    end
  end