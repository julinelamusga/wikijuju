require "spec_helper"

def sign_in user
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: "helloworld"
  click_on "Sign in"
end

feature "Index page works" do
  scenario "all cases" do
    visit root_path

    expect(page).to have_content("WikiJuJu")
  end
end

feature "Create juju" do
  scenario "when user not signed in" do
    visit root_path

    click_on "Create a JuJu"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end

feature "User views premium juju" do
  scenario "when user not signed in" do
    wiki = FactoryGirl.create(:premium_wiki)

    visit wiki_path(wiki)

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
  scenario "when user not premium" do
    wiki = FactoryGirl.create(:premium_wiki)
    user = FactoryGirl.create(:user)

    sign_in user

    visit wiki_path(wiki)

    expect(page).to have_content "You are not authorized to perform this action."
  end
  scenario "when user is a collaborator of the JuJu" do
    wiki = FactoryGirl.create(:premium_wiki_with_collaborator)
    
    sign_in wiki.users.first

    visit wiki_path(wiki)

    expect(page).to have_content wiki.name
  end
  scenario "when user is the owner of the JuJu" do
    wiki = FactoryGirl.create(:premium_wiki)
    user = wiki.user

    sign_in user

    visit wiki_path(wiki)

    expect(page).to have_content wiki.name
  end
end