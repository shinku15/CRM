# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<% unless @task.is_completed %>
        <% form_for ([@company, @task]) do |f| %>

         <div>
          <%= f.label :Status %>
          <%= check_box_tag :is_completed %>Completed</br></br>
          </div>

          <div class="actions">
            <%= f.submit %>
          </div>

        <% end %>
<% end %>  


<div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
              <h4 class="modal-title" id="myModalLabel">Edit Company</h4>
            </div>
            <div class="modal-body">

            <div class="modal-footer">
            </div>

          </div>
        </div>
      </div>

<table class="table table-striped table-bordered table-hover" id="feed">
  <thead>
    <tr>
      <th>Feedable Type</th>
      <th>Organization</th>
      <th>Created at</th>
      <th>Feed description</th>
    </tr>
  </thead>

  <tbody>   
    <%= render @feeds %>
  </tbody>
</table>

<br>


_company.html.erb
<tr data-company-id='<%company.id%>'>
        <td><%= company.name %></td>
        <td><%= company.email %></td>
        <td><%= company.address %></td>
        <td><%= company.contact %></td>
        <td><%= company.organization.name %></td>
        <td><%= link_to 'Show', company %></td>
        <td><%= link_to 'Edit', edit_company_path(company),remote: true,'data-toggle': "modal",'data-target': "#myModal" %></td>
        <td><%= link_to 'Destroy', company, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>


_feed.html.erb
 <tr data-feed-id='<%= feed.id%>'>
        <td><%= feed.feedable_type %></td>
        <td><%= feed.organization.name %></td>
        <td><%= feed.created_at %></td>
        <td><%= feed.content %></td>
      </tr>


_task.html.erb
<td><%= task.description %></td>
        <td><%= task.company.name %></td>
        <td><%= task.completed_on %></td>
        <td><%= task.user.email %></td>
        <td><%= task.assigned.email %></td>
        <td><%= task.is_completed %></td>
        <td><%= link_to 'Show',company_task_path(@company,task) %></td>
        <td><%= link_to 'Edit', edit_company_task_path(@company,task),remote: true, 'data-toggle': "modal",'data-target': "#myModal"  %></td>
        <td><%= link_to 'Destroy', company_task_path(@company,task), method: :delete, data: { confirm: 'Are you sure?' } %></td>

@feed.update_attributes(content: @task.description)        


// $("tr[data-company-feed-id='<%= @feed.id%>']").hide().after("<%= j render partial:'notes/form1' %>");
// <%= @note.error.full_messages %>
// <%= render partial:'notes/form1' %>

$('#myModal').html('<%= j render partial:'form' %>')

<% unless task.is_completed %>

                          _feed.html.erb
                         <strong><%= link_to 'Edit',edit_company_note_path(feed.company_id, feed.feedable_id),remote: true,'data-toggle': "modal",'data-target': "#myModal"  %></strong>

                         <strong><%= link_to 'Edit',edit_company_note_path(feed.company_id, feed.feedable_id),
                         id: "edit_link",remote: true %></strong>


                          edit.js.erb
                          $('#myModal').html('<%= j render partial:'form' %>')

                           $("[company_feed data-company-feed-id='<%= @feed.id%>']").hide().after("<%= j render partial:'notes/form1' %>");

                          _task.html.erb
                           <% unless task.is_completed %>
                           <%= link_to 'Complete', complete_company_task_path(@company, task), method: :put,remote: true,
                style: 'margin-right:10px;' %>
                <% end %>


<div>
                      <%= f.check_box :is_completed, id: check_box %> Complete </br></br>
                      </div>


                      task
                      <%= f.label :completed_on %><br/>
                      <%= f.text_field :completed_on, 'data-provide': 'datepicker',class: "form-control" %>
                      <span class="input-group-addon">
                                   <span class="glyphicon glyphicon-calendar"></span>
                      </span>





                      <!-- <div class="form-group">
                        <%= label_tag 'Complete' %>
                          <%= select_tag "option1", options_for_select(@opt1.collect {|p| [ p['name'], p['id'] ] }, params[:option1]) %>
                      </div> -->


                      <!-- <div class="col-md-2 offset-4">
                      <%= form_tag organizations_path, method: :get, class: "form-inline", id: "select_form2", remote: :true do %>
                        <div class="form-group">
                          <%= label_tag 'User' %>
                          <%= select_tag "option2", options_for_select(@opt2.collect {|p| [ p['username'], p['id'] ] }, params[:option2]) %>
                        </div>
                      <% end %>
                    </div> -->




RegistrationsController

before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]

 # GET /resource/sign_up
 def new
   super
 end

 # POST /resource
 def create
   super
 end

 # GET /resource/edit
 def edit
   super
 end

 # PUT /resource
 def update
   super
 end

 # DELETE /resource
 def destroy
   super
 end

 # GET /resource/cancel
 # Forces the session data which is usually expired after sign
 # in to be expired now. This is useful if the user wants to
 # cancel oauth signing in/up in the middle of the process,
 # removing all OAuth session data.
 def cancel
   super
 end

 # protected

 # If you have extra params to permit, append them to the sanitizer.
 def configure_sign_up_params
   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
 end

 # If you have extra params to permit, append them to the sanitizer.
 def configure_account_update_params
   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
 end

 # The path used after sign up.
 def after_sign_up_path_for(resource)
   super(resource)
     staticpages_show_path
 end

 # The path used after sign up for inactive accounts.
 def after_inactive_sign_up_path_for(resource)
   super(resource)
 end


#organization-index.html.erb
<div class="col-md-2">
<%= form_tag organizations_path, method: :get, class: "form-inline", id: "select_form", remote: :true do %>
  <div class="form-group">
      <%= label_tag 'Due' %>
      <%= select_tag "option", options_for_select(@opt.collect {|p| [ p['name'], p['id'] ] }, params[:option]) %>
  </div>
<% end %>
</div>








<div class ="row">

<div class="col-md-2" >
<span class="label label-primary">Due Task</span>
  <ul data-due-selector="due-task">
    <li data-due-option="all"><span class="badge">All</span></li>
    <li data-due-option="overdue"><span class="badge">Overdue</span></li>
    <li data-due-option="today"><span class="badge">today</span></li>
    <li data-due-option="tomorrow"><span class="badge">Tomorrow</span></li>
  </ul>
</div>

  <div class="col-md-2 offset-2">
  <span class="label label-primary">Complete Task</span>
    <ul data-complete-selector="complete-task">
      <li data-complete-option="all"><span class="badge">All</span></li>
      <li data-complete-option="today"><span class="badge">Today</span></li>
      <li data-complete-option="yesterday"><span class="badge">Yesterday</span></li>
      <li data-complete-option="earlier"><span class="badge">Earlier</span></li>
    </ul>
  </div>

    <div class="col-md-2 offset-4">
    <%= form_tag organizations_path, method: :get, class: "form-inline", id: "select_form2", remote: :true do %>
      <div class="form-group">
        <%= label_tag 'User' %>
        <%= select_tag "option2", options_for_select(@opt2.collect {|p| [ p['username'], p['id'] ] }, params[:option2]) %>
      </div>
    <% end %>
  </div>
</div>
