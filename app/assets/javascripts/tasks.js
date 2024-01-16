// app/assets/javascripts/tasks.js

$(document).on('submit', '#search-form', function(e) {
    e.preventDefault();
  
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data) {
        updateTable(data);
      }
    });
  });
  
  function updateTable(tasks) {
    // Assuming you have a table with id 'tasks-table', update it with the new tasks
    var table = $('#recent_book tbody');
    table.empty(); // Clear existing rows
  
    $.each(tasks, function(index, task) {
      // Append new rows to the table
      var row = '<tr data-href="' + task.edit_path + '">';
      row += '<td><input type="checkbox" class="check" data-task-id="' + task.id + '" /></td>';
      row += '<td>' + task.name + '</td>';
      row += '<td>' + task.description + '</td>';
      // Add other columns as needed
      row += '</tr>';
      table.append(row);
    });
  }
  