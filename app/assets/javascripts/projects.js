$(document).ready(function () {
  //Обработка check_box

  $('div#projects').on('click', 'input[type=checkbox]',  function() {
    var checkbox = $(this);
        task_id = (checkbox.attr("id")).match(/([0-9]+)/)[1];
        project_id = checkbox.parents('.panel').attr("id").match(/([0-9]+)/)[1];

    if (checkbox.is(':checked')) {
      $( '#task_' + task_id ).addClass( 'active' );
      $.ajax({
        type: "PUT",
        url: "/projects/" + project_id + "/tasks/" + task_id,
        data: {
          task: {
            complete: true
          }
        }
      });
    } else {
      $( '#task_' + task_id ).removeClass( 'active' );
      $.ajax({
        type: "PUT",
        url: "/projects/" + project_id + "/tasks/" + task_id,
        data: {
          task: {
            complete: false
          }
        }
      });
    }
  });

  //обработка кнопок приоритета

  $('div#projects').on('click', 'a.priority',  function(event) {
    var button = $(this);
        priority = (button.attr("id")).match(/(up|down)/)[1];
        task_id = (button.attr("id")).match(/([0-9]+)/)[1];
        project_id = button.parents('.panel').attr("id").match(/([0-9]+)/)[1];
        project = $("#project_" + project_id + " .list-group-item" );
        task = button.parents('.list-group-item');
        task_index = project.index(task);
        top_el = project.eq(task_index - 1);
        top_el_id = (top_el.attr("id")).match(/([0-9]+)/)[1];
        down_el = project.eq(task_index + 1);
        down_el_id = (down_el.attr("id")).match(/([0-9]+)/)[1];

    event.preventDefault();

    if (priority == "up") {
      if ((task_index - 1) < 0) return;
      top_el.before(task);
      $.ajax({
        type: "PUT",
        url: "/projects/" + project_id + "/tasks/" + task_id,
        data: {
          task: {
            priority: task_index - 1
          }
        }
      });

      $.ajax({
        type: "PUT",
        url: "/projects/" + project_id + "/tasks/" + top_el_id,
        data: {
          task: {
            priority: task_index
          }
        }
      });
    };

    if (priority == "down") {
      if (task_index + 1 == (project.length) ) return;
      down_el.after(task);
      $.ajax({
        type: 'PUT',
        url: "/projects/" + project_id + "/tasks/" + task_id,
        data: {
          task: {
            priority: task_index + 1
          }
        }
      });
      $.ajax({
        type: "PUT",
        url: "/projects/" + project_id + "/tasks/" + down_el_id,
        data: {
          task: {
            priority: task_index
          }
        }
      });
    }
  });
});