require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'does not allow duplicate project name per user' do
    user = User.create(
      first_name: 'Joe',
      last_name: 'Tester',
      email: 'tester@example.com',
      password: 'joepassword',
    )

    user.projects.create(
      name: "Test project",
    )

    new_project = user.projects.build(
      name: "Test project",
    )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it 'allows two users to share a project name' do
    user = User.create(
      first_name: 'Joe',
      last_name: 'Tester',
      email: 'tester@example.com',
      password: 'joepassword',
    )

    user.projects.create(
      name: "Test project",
    )

    other_user = User.create(
      first_name: 'Jane',
      last_name: 'Tester',
      email: 'janetester@example.com',
      password: 'janepassword',
    )

    other_project = other_user.projects.build(
      name: "Test project",
    )

    expect(other_project).to be_valid
  end

  describe 'late status' do
    it 'is late when the due date is past today' do
      project = FactoryBot.create(:project, :due_yesterday)
      expect(project).to be_late
    end

    it 'is on time when the due date is today' do
      project = FactoryBot.create(:project, :due_today)
      expect(project).to_not be_late
    end

    it 'is on time when the due date is in the future' do
      project = FactoryBot.create(:project, :due_tomorrow)
      expect(project).to_not be_late
    end
  end

  it 'can hame many notes' do
    project = FactoryBot.create(:project, :with_notes)
    # puts project.inspect
    # puts project.notes.map(&:inspect)
    expect(project.notes.size).to eq 5
  end
end
