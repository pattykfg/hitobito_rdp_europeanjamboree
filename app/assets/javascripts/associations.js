$(document).ready(function() {
    console.log("Load Associations CS for Dropdowns");
    console.log(association_tree)
    for (const [key, value] of Object.entries(association_tree)) {
        $("select#person_rdp_association").append(`<option>${key}</option>`);
    }
    console.log("Done Associations CS for Dropdowns");


    $("select#person_rdp_association").click(function(){
        var association = $("select#person_rdp_association").val();
        for (const [key, value] of Object.entries(association_tree[association])) {
            $("select#person_rdp_association_region").append(`<option>${key}</option>`);
        }
    })

    $("select#person_rdp_association_region").click(function(){
        var association = $("select#person_rdp_association").val();
        var association_region = $("select#person_rdp_association_region").val();
        for (const [key, value] of Object.entries(association_tree[association][association_region])) {
            $("select#person_rdp_association_group").append(`<option>${key}</option>`);
        }
    })
});
