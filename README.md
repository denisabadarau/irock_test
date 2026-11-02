# README


a simple Rails application to store names and emails in the database. The app
should have a page with an input form with two fields: Email and Name. Once a user submits the
form, the data is stored in the database, and the user should see the &quot;Thank you&quot; page.
Details:
- It should only be possible to submit the form when the email is provided and includes the &quot;@&quot;
character. This verification should be done on the fly, as user type, not only after the form is
submitted. If there are errors (email is not provided or does not include &quot;@&quot;), then a message
should be displayed (&quot;Please provide an email before submitting the form&quot; or &quot;Please the email
must have an @ character&quot;).
- The emails in the database shouldn&#39;t be duplicated, but even if users provide the same email
again, they see the &quot;Thank you&quot; page.
- Any relational database may be used
- The content of the pages should be centred and styled more or less as follows (it doesn&#39;t have to
be an exact copy) like in the attached images.