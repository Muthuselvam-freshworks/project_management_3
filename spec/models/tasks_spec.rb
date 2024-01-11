require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).to be_valid
  end

  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: nil,
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end

  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: nil,
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end

  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: nil,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end
  
  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: nil,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end


  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:nil,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end

  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: nil,
        start_date: Time.now,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end

  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: nil,
        status: 'Completed',
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end
  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: nil,
        background_color: 'red'
    )
    expect(task).not_to be_valid
  end

  it 'is valid with a name, description, start_date , due_date , priority , status, user_id , project_id , background_color' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.create(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    task = Task.new(
        name: 'task 1',
        description: 'desc',
        project_id: project.id,
        user_id: user.id,
        due_date:Time.now,
        priority: 'high',
        start_date: Time.now,
        status: 'Completed',
        background_color: nil
    )
    expect(task).not_to be_valid
  end
end