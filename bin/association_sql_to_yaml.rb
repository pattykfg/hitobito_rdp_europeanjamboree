class Assocentry
    attr_reader :id, :parent, :name 
    def initialize(id, parent, name)
       @id = id
       @parent = parent
       @name = name
    end
 end

def build_tree (file, array, parent_id, depth) 
    array.each { |e|
        if e.parent == parent_id
            file.puts  " " * depth + e.name + ":\n"
            build_tree(file, array, " " +e.id, depth + 2)    
        end  
    }
end


print "Create the Association Yaml File"
assoc_array = Array.new 

text=File.open('associations.sql').read
text.each_line do |line|
    linearray = line.gsub!("\t(","").gsub!(",\n","").gsub("'","").split(",")
    assocentry = Assocentry.new(linearray[0],linearray[1],linearray[2])
    assoc_array.push(assocentry)
end

open("associations.yml" , "w") {|file|
    build_tree(file, assoc_array, " 0", 2) 
}
