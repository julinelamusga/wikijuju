require "spec_helper"

feature "Index page works" do
  scenario "all cases" do
    visit root_path

    expect(page).to have_content("WikiJuJu")
  end
end

feature "Prevent unauthorized viewing of premium juju" do
  scenario "when user not signed in" do
    user = User.new(name: Faker::Name.name, 
                   email: "premium@example.com",
                   password: "helloworld",
                   password_confirmation: "helloworld")
    user.premium = true
    user.skip_confirmation!
    user.save

    wiki = user.wikis.build(name: "Premium JuJu")
    wiki.premium = true
    wiki.save

    visit wiki_path(wiki.id)
    expect(page).to have_content("not authorized")
  end
  scenario "when user not premium"
end