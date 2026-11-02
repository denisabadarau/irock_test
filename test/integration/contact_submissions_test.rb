require "test_helper"

class ContactSubmissionsTest < ActionDispatch::IntegrationTest
  test "shows the contact form at the root path" do
    get root_path

    assert_response :success
    assert_select "label", "Your email"
    assert_select "label", "Your name"
    assert_select "[data-submit-button]"
  end

  test "saves valid details and shows the thank-you page" do
    assert_difference("Contact.count", 1) do
      post contacts_path, params: { contact: { name: "Sam Example", email: "Sam@Example.com" } }
    end

    assert_redirected_to thank_you_path
    follow_redirect!
    assert_response :success
    assert_select "h2", "Thank you"
    assert_equal "sam@example.com", Contact.last.email
  end

  test "duplicate emails still receive thanks without another row" do
    Contact.create!(name: "First", email: "same@example.com")

    assert_no_difference("Contact.count") do
      post contacts_path, params: { contact: { name: "Second", email: "SAME@example.com" } }
    end

    assert_redirected_to thank_you_path
  end

  test "rejects a missing email with its message" do
    post contacts_path, params: { contact: { name: "Sam", email: "" } }

    assert_response :unprocessable_entity
    assert_select "[data-email-error]", "Please provide an email before submitting the form"
    assert_equal 0, Contact.count
  end

  test "rejects an email without an at sign with its message" do
    post contacts_path, params: { contact: { name: "Sam", email: "sam-example.com" } }

    assert_response :unprocessable_entity
    assert_select "[data-email-error]", "Please the email must have an @ character"
    assert_equal 0, Contact.count
  end

  test "rejects a missing name with its message" do
    post contacts_path, params: { contact: { name: "", email: "sam@example.com" } }

    assert_response :unprocessable_entity
    assert_select "[data-name-error]", "Please provide your name before submitting the form"
    assert_equal 0, Contact.count
  end
end
