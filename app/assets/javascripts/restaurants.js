// autocomplete popdown manage and displaying restuarant details
// search_input_id is the id of the search box

// ajax request to get hash of restaurant name and ids corresponding to the text written in restaurant searchbox
function get_restaurant_suggestions(key,suggestion_path){
    var searched_results = $.ajax({
        type: "get",
        minLength : 1,
        dataType : "json",
        url: suggestion_path,
        data: {
            "key":key
        },
        async: false
    }).responseText;
    return JSON.parse(searched_results);
}

function load_restaurant_name_autocomplete(suggestion_path,search_input_id,selector_id){
    var NO_MATCHES_FOUND = "No results found";
    $( "#"+search_input_id ).autocomplete({
        source: function( request, response ) {
            // getting suggestions
            var suggestions = get_restaurant_suggestions(request.term,suggestion_path);
            if($.trim(suggestions[0]).length==0){ //acknowledge that no suggestions were found
                suggestions= NO_MATCHES_FOUND;
            }
            response(suggestions);
        },
        change: function(event,ui){
            if (!ui.item && $(this).val() != "") {
                $("#"+search_input_id).autocomplete("close");
                $('#'+selector_id).val('');
                $('#'+search_input_id).val('');
            }
        },
        focus: function() {
            if($(this).text()==NO_MATCHES_FOUND) {
                $(this).blur();
            }
            // prevent value inserted on focus
            return false;
        },
        select: function(event, ui) {
            if(ui.item.value != NO_MATCHES_FOUND){
                window.location = "/restaurants/" + ui.item.value;
                //                $('#'+selector_id).val(ui.item.value);
                $('#'+search_input_id).val(ui.item.label);
                this.value = ui.item.label; //setting the selected value in the input field
            }
            return false;
        }
    }).keydown(function (event, ui) {
        if(event.keyCode === 13) {
            event.preventDefault();
            event.stopPropagation();
            $('#'+search_input_id).blur();
            $('#'+search_input_id).autocomplete("close");
            return false;
        }
    });
}

