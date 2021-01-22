# Prebuild Pruner

A CloudCannon prebuild script to prune files out of the build using a [prebuild script](_cloudcannon-prebuild.sh). The target use case is for removing pages that have been added to the build by a plugin (i.e. pagemaster).

The data lives in [_data/filter.csv](_data/filter.csv) and is editable by non-developers in the CloudCannon CMS.

By using the key `item` in the CSV, which matches our collection name `items`, CloudCannon provides a dropdown of files which makes the editing experience very friendly.

The mechanism of action is adding a `published: false` flag to the items specified in the [CSV file](_data/filter.csv). A caveat here is that these files will disappear from the dropdown once they are removed from the build, since CloudCannon looks at the build output to populate dropdowns. This doesn't prevent the action from working, but makes revisiting the data file in the CMS behave odd, as the dropdowns will look empty (but still work).  
We can mitigate this however. Since we use the published flag rather than deleting the file outright, it means you can use a staging website on CloudCannon configured with `--unpublished`. In this setup all files will still be available in select boxes, while hidden on the production website.

View it in action here: https://devout-gnat.cloudvent.net/ - filtered based on the current [filter.csv data file](_data/filter.csv)

Editing the CSV in CloudCannon will appear as below
![Editing the filter.csv data file in the CloudCannon CMS, showing three filters that have been created for a, b, and c](data-screenshot-array.png?raw=true "Filter Array")

Editing each rule in CloudCannon will appear as below, where "Item" is a dropdown populated by the items collection.
![Editing an individual filter from the array, item A, showing the dropdown populated with item A and a ticked checkbox labelled hide](data-screenshot.png?raw=true "Individual Filter")
