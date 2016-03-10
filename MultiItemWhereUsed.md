# Introduction #
A tool for finding out if any items in a folder are actually used

The requirement came from having a Test Content folder on a UAT environment, Components within this folder were used during development to populate pages as examples for the Editors to follow. These should have been replaced by items in a real Content folder.

When it came to move to live (UAT had been used to enter content for various reasons) it was hard to tell if items were being used in that folder and if so where. It took a long time to dig through the pages (and we had relatively few pages) and make a list which the Content Editors could then use to either move the component into the "real" Content folder. This would have been a much larger job if we had more pages.

The goal of this extension is to solve that by adding a Context Menu item that will build the summary for you.

# Details #

Still in Definition stage.

|Audience|Suggested implementation|Original Developer|Priority|Difficulty|Status|Notes|
|:-------|:-----------------------|:-----------------|:-------|:---------|:-----|:----|
| Admin/Content Editor | Context menu on folder/keyword/category|N/A               |High    |Medium    |      |Useful for checking if test content is used|

## Description ##
Shows a summary list of any items used within the target folder. Could have a "recursive" option to search a full tree structure.

## Mock up ##
![http://i.imgur.com/XDmplQO.png](http://i.imgur.com/XDmplQO.png)

## Audience ##
Developers, Admins and Power Users

**Version #**
0.1

Original release date
TBD

Last updated
TBD

**Contributor(s)**
{list contributors}

**Document Author(s)**
{list authors}

# Requirements #
| ID | Description | Scope | Comments |
|:---|:------------|:------|:---------|
| 1  | ...         | ...   | ...      |
| 2  | ...         | ...   | ...      |