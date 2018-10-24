# Afternoon Challenge: Networking Module 3

This morning, you wrote an application that loaded a news feed and displayed it in a table view controller. This afternoon you modify that application with the following requirements:

## Preferences

* Design a way for the news controller to co-exist with some sort of preferences view controller. 
* The preferences controller must allow the user to select between 10, 20, 50, and 100 articles at a time (use a segmented control), and add at least two other display preferences of your own choice that are stored using User Defaults.

The presentation of defaults in the preferences view controller must be synchronized to the User Defaults settings so the controls match up to User Defaults and changes to the controls are stored to Defaults.

## Detail View Controller

Add a  detail view controller of your own design that displays more content available from the news feed, including the article content, source, article author, etc.

Populate and show this controller when the user taps any news item in your primary table. Trim down the main table so it just shows a wrapped headline (up to 3 lines) above a small detail label and a thumbnail if one is available. Place the thumbnail to the right of the headline and detail so the text is all aligned just off the leading edge of the table.

## Appearance

Both table and detail view controllers should look tight and professional, and the way you access in-app preferences should feel like a real app store app. 

## Stretch: Working Link

Add a working link to the original news article (sourced from `url`) to your detail view controller so the user can read the entire article at its source by tapping a "read full article" button. The link will open in the device's Safari browser.

## More of a Stretch: Thumbnails and Cache

Store thumbnails instead of full sized images with the record. Create a full size image cache (a dictionary) that associates each full sized image (value) with its url location string (key). 

Use the large image on the detail presentation page. If it isn't available, set the thumbnail as the image until the full size image is available and then replace it at that time.

Implement `didReceiveMemoryWarning` and empty the full sized image cache dictionary of all its contents when you receive memory warnings. Create low memory conditions in the simulator with Debug > Simulate Memory Warning. When you need a full size image that is no longer in the cache, you must re-download it. 