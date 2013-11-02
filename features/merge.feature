Feature: Admin has option to merge articles

As an administrator
I want to merge articles
So that information from similar articles can be consolidated.

Background:
Given the blog is set up
And the following articles exist:
| title   | author  | body  | published |
| Article 1 | Author 1  | Blog 1 text. | true |
| Article 2 | Author 2 | Blog 2 text. | true |
And the following users exist:
| login | password | email  | name  | profile_id |
| administrator | administrator123 | administrator@gmail.com | Blog Admin | 1 |
| blogger | blogger123   | blogger@gmail.com  | Blog Publisher | 2  |

Scenario: A non-admin cannot merge two articles
Given the current user is "blogger"
And I visit the edit page for "Article 2"
Then I should not see "Merge Articles" 

Scenario: When articles are merged, the merged article should contain the text of both previous articles
Given the current user is "administrator"
And I visit the edit page for "Article 1"
And I merge with "Article 2"
Then I should see "Blog 1 text. Blog 2 text."

# Scenario: When articles are merged, the merged article should contain comments of both previous articles
# Given the current user is "administrator"
# And "Article 1" contains comments with id: 1, 2, 3
# And "Article 2" contains comments with id: 4, 5
# And I visit the edit page for "Article 1"
# And I merge with "Article 2"  
# Then the merged article should contain comments with id: 1, 2, 3, 4, 5

# Scenario: Merged article should have title of either article
# Given the current user is "administrator"
# And I visit the edit page for "Article 1"
# And I merge with "Article 2"
# Then the merged article should have either title "Article 1" or "Article 2"

# Scenario: Merged article should have author of either article
# Given the current user is "administrator"
# And I visit the edit page for "Article 1"
# And I merge with "Article 2"
# Then the merged article should have either author "Author 1" or "Author 2"