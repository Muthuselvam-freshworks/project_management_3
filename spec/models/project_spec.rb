require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'is valid with a project_name, description, and created_user_id' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.new(
      project_name: 'Sample Project',
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    expect(project).to be_valid
  end

  it 'is invalid without a project_name' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test2@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.new(
      project_name: nil,
      description: 'This is a sample project description.',
      created_user_id: user.id
    )
    project.valid?
    expect(project.errors[:project_name]).to include("can't be blank")
  end

  it 'is invalid without a project_name' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test2@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.new(
      project_name: 'Sample Project',
      description: nil,
      created_user_id: user.id
    )
    project.valid?
    expect(project.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without a project_name' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test2@example.com', password: 'password123' , password_confirmation: 'password123')
    project = Project.new(
      project_name: 'Sample Project',
      description: 'desc',
      created_user_id: nil
    )
    project.valid?
    expect(project).not_to be_valid
  end

end
