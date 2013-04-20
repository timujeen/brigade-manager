Feature: Manage brigades
	In order to make brigades
	As an user
	I want to create and manage brigades

	Scenario: Create valid brigade
		Given I have no brigades
		And I have jobs titled Wash, Dry
		And I have countries titled Russia
		And I am on the list of brigades
		When I follow "New brigade"
		And I fill in "Title" with "brig"
		And I fill in "Count of workers" with "10"
		And I fill in "Price" with "100"
		And I select "Russia" from "Country"
		And I select "Wash" from "Jobs"
		And I fill in "Other jobs" with "Dry, Clean"
		And I press "Save"
		Then I should be redirected to the list of brigades
		And I should see "New brigade created."
		And I should see "brig"
		And I should see "10"
		And I should see "100.0"
		And I should see "Russia"
		And I should see "Wash, Dry, Clean"
		And I should have 1 brigade
		And I should have 3 jobs

	Scenario: Filtering brigades by link from jobs list
		Given I have jobs titled Wash, Dry, Clean
		And I have countries titled Russia
		And I have brigade titled brig1 with jobs titled Wash, Dry
		And I have brigade titled brig2 with jobs titled Dry, Clean
		And I have brigade titled brig3 with jobs titled Wash, Clean
		And I am on the list of jobs
		When I follow "Wash"
		Then I should see "brig1"
		And I should see "brig3"
		And I should not see "brig2"

	Scenario: Filtering brigades by filter on form (country + jobs)
		Given I have jobs titled Wash, Dry, Clean
		And I have countries titled Russia, Ukraine
		And I have brigade titled brig1 with country "Russia" and with jobs "Wash, Dry"
		And I have brigade titled brig2 with country "Russia" and with jobs "Dry, Clean"
		And I have brigade titled brig3 with country "Russia" and with jobs "Wash"
		And I have brigade titled brig4 with country "Ukraine" and with jobs "Wash, Dry"
		And I have brigade titled brig5 with country "Ukraine" and with jobs "Dry, Clean"
		And I have brigade titled brig6 with country "Ukraine" and with jobs "Wash"
		And I am on the list of brigades
		When I select "Ukraine" from "Country"
		And I select "Clean" from "Jobs"
		And I select "Dry" from "Jobs"
		And I press "Search"
		Then I should see "brig4"
		And I should see "brig5"
		And I should not see "brig1"
		And I should not see "brig2"
		And I should not see "brig3"
		And I should not see "brig6"

