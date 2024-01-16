
function toggleNavigation(){
    location.reload();
  var sidebarValue = JSON.parse(localStorage.getItem('sidebar'));
    sidebarValue = !sidebarValue;
    localStorage.setItem('sidebar',sidebarValue);
  }
  
  var sidebarValue = JSON.parse(localStorage.getItem('sidebar'));
  
  if (sidebarValue) {
    const navigation = document.querySelector('.navigation');
    const main = document.querySelector('.main');
    const title = document.querySelector('#title');
    navigation.classList.toggle('active');
    main.classList.toggle('active');
    title.classList.toggle('active');
  
    const isCollapsed = title.classList.contains('active');
    title.textContent = isCollapsed ? 'PM' : 'PROJECT MANAGEMENT';
  }else {
    const navigation = document.querySelector('.navigation');
    const main = document.querySelector('.main');
    const title = document.querySelector('#title');
    navigation.classList.remove('active');
    main.classList.remove('active');
    title.classList.remove('active');
  
    const isCollapsed = title.classList.contains('active');
    title.textContent = isCollapsed ? 'PM' : 'PROJECT MANAGEMENT';
  
  }
  
  $(document).ready(function() {
  $('#search-button').on('click', function() {
  var query = $('#search-input').val();
  $.ajax({
    url: '/dashboard/search',
    type: 'GET',
    dataType: 'json', 
    data: { query: query },
    success: function(data) {
  console.log(data);
  $('#recent_book tbody').empty();
  data.created_projects.forEach(function(project) {
  var newRow = '<tr onclick="window.location=\'/projects/' + project.id + '/overview\'">';
  newRow += '<td id="name">' + project.project_name + '</td>';
  newRow += '<td id="date">' + project.description + '</td>';
  newRow += '<td><span class="status delivered">Active</span></td>';
  newRow += '</tr>';
  $('#recent_book tbody').append(newRow);
  });
  $('#recent_cus tbody').empty();
  data.joined_projects.forEach(function(project) {
  var newRow = '<tr onclick="window.location=\'/projects/' + project.id + '/overview\'">';
  newRow += '<td id="name">' + project.project_name + '</td>';
  newRow += '<td id="date">' + project.description + '</td>';
  newRow += '<td><span class="status delivered">Active</span></td>';
  newRow += '</tr>';
  $('#recent_cus tbody').append(newRow);
  });
  },
    error: function() {
      alert('Error fetching projects.');
    }
  });
  });
  });
  
  var currentPagePath = window.location.pathname;
  console.log(currentPagePath);
  $('.navigation ul li a[href="' + currentPagePath + '"]').parent().addClass('hovered');