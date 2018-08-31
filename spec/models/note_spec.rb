require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = User.create(
      first_name: 'Joe',
      last_name: 'Tester',
      email: 'tester@example.com',
      password: 'joepassword',
    )

    @project = @user.projects.create(
      name: 'Test project',
    )
  end

  xit 'generates associated data from a factory' do
    note = FactoryBot.create(:note)
  end

  describe "search message for a term" do
    context 'when a match is found' do
      it 'returns notes that match the search term' do

        note1 = @project.notes.create(
          message: 'This is the first note.',
          user: @user,
        )

        note2 = @project.notes.create(
          message: 'This is the second note.',
          user: @user,
        )

        note3 = @project.notes.create(
          message: 'First, preheat the oven.',
          user: @user,
        )

        expect(Note.search("first")).to include(note1, note3)
        expect(Note.search("first")).to_not include(note2)
      end
    end

    context 'when no match is found' do
      it 'returns an empty collection when no results are found' do
        note1 = @project.notes.create(
          message: 'This is the first note.',
          user: @user,
        )

        note2 = @project.notes.create(
          message: 'This is the second note.',
          user: @user,
        )

        note3 = @project.notes.create(
          message: 'First, preheat the oven.',
          user: @user,
        )

        expect(Note.search("message")).to be_empty
      end
    end
  end
end
