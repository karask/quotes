
$(document).ready(function() {

  var auth_typeahead = $('#author-search-input').typeahead();
                                                    
  auth_typeahead.data('typeahead').source = auth_typeahead.data().mysource;
  auth_typeahead.data('typeahead').updater = function(item) {
      this.$element[0].value = item;
      this.$element[0].form.submit();
      return item;
  };

  var tag_typeahead = $('#tag-search-input').typeahead();
                                                    
  tag_typeahead.data('typeahead').source = tag_typeahead.data().mysource;
  tag_typeahead.data('typeahead').updater = function(item) {
      this.$element[0].value = item;
      this.$element[0].form.submit();
      return item;
  };

});
