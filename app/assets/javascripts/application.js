// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .





    $(function() {
      $('#posting_source_category_ids').click(function() {
        $('#overlay').show();
        $('.category-selector').show();
      })

      $('#category1 li').click(function() {
        $('#category1 li').removeClass('active');
        $(this).addClass('active');
        $('.select-button').attr('disabled', true);
        $('.category-input2').val('');
        $('.category-input3').val('');
        $('.category-input3Name').val('');
        $('.category-input2Name').val('');
      })

      $('.select-button').click(function() {
        var input2 = $('.category-input2Name').val();
        var input3 = $('.category-input3Name').val();

        var value2 = $('.category-input2').val();
        var value3 = $('.category-input3').val();

        var text =  [input2, input3].join(' >> ');
        var value = [value2, value3];
        
        var options =  document.createElement("option");
        var optionsText = document.createTextNode(text);
          console.log(optionsText)
        options.appendChild(optionsText)
        console.log(options)
        var select = document.getElementById('posting_source_category_ids');
        console.log(select);
        options.setAttribute("selected", "selected");
        options.setAttribute("value", value);

        select.add(options);
        $('#overlay').hide();
        $('.category-selector').hide();
      })


      $('.cancel-button').click(function() {
        $('#overlay').hide();
        $('.category-selector').hide();
      })
    })




   $(function() {
      $('#product_category_ids').click(function() {
        $('#overlay').show();
        $('.category-selector').show();
      })

      $('#category1 li').click(function() {
        $('#category1 li').removeClass('active');
        $(this).addClass('active');
        $('.select-button').attr('disabled', true);
        $('.category-input2').val('');
        $('.category-input3').val('');
        $('.category-input3Name').val('');
        $('.category-input2Name').val('');



      })

      $('.select-button').click(function() {
        var input2 = $('.category-input2Name').val();
        var input3 = $('.category-input3Name').val();

        var value2 = $('.category-input2').val();
        var value3 = $('.category-input3').val();

        var text =  [input2, input3].join(' >> ');
        var value = [value2, value3];
        
        var options =  document.createElement("option");
        var optionsText = document.createTextNode(text);
        
        options.appendChild(optionsText)
        var select = document.getElementById('product_category_ids');

        options.setAttribute("selected", "selected");
        options.setAttribute("value", value);

        select.add(options);
        $('#overlay').hide();
        $('.category-selector').hide();
      })


      $('.cancel-button').click(function() {
        $('#overlay').hide();
        $('.category-selector').hide();
      })
    })