# Introduction #

A "Help" option to provide end-user "how-to" information, instructions, and ways to contact the PowerTools group.

This will be a simple tool as a collection of information, though a more sophisticated help system could offer context-sensitive options or integration directly into individual tools (via a help button for each tool, hover-over text, etc).

# Details #

|Suggested implementation|Original Developer|Priority|Difficulty|Status|Notes|
|:-----------------------|:-----------------|:-------|:---------|:-----|:----|
|Button on PowerTools dashboard tab|N/A / new suggestion by Alvin Reyes|Medium  |Low       |In requirements|Good learning experience, but should aim to actually be helpful to end users. Could eventaully incorporate, include, or explain the "example" PowerTool (which can eventually be hidden from regular users) |

![https://tridion-2011-power-tools.googlecode.com/svn/wiki/images/help.png](https://tridion-2011-power-tools.googlecode.com/svn/wiki/images/help.png)

## Description ##
Help screen will provide three types of information to the end user:
  1. Basic "how-to" information for the released PowerTools
  1. Contact info and bug submission instructions
  1. Developer information (optional, since devs can visit the code repository)

## Scope ##
**In-scope:**
  * Information to help end users (including power users and developers acting as end users, interacting with the CME)
  * PowerTools logo, credits, contact information, images, video, and other rich text or multimedia to explain the tools
  * end-user troubleshooting information
  * Frequently Asked Questions (FAQ)

**Out-of-scope:**
  * instructions on how to develop PowerTools, though a reference to the project or information on the example PowerTool would be appropriate
  * sand-box or playground examples (local, non-committed code and the ExamplePowerTool should be used for this)

## Audience ##
All users

**Version #**
1.0

Original release date

18-Feb 2012

**Last updated:**

18-Feb 2012

**Contributor(s)**
Alvin Reyes

**Document Author(s)**
Alvin Reyes

# Functional Requirements #
| ID | Description | Comments |
|:---|:------------|:---------|
| 1  | **Helpful.** Help screen must describe basic PowerTools instructions, including how to use a "generic" tool. | All users, tool must be available from the PowerTools tab |
| 2  | **Comprehensive.** Help screen should list available tools and their descriptions | Screenshots helpful, but optional. |
| 3  | **Integrated.** User should be able to return to the CME or other PowerTools easily | Help should be incorporated along with the PowerTools (rather than an install, help file system, or PDF)  |
| 4  | **Easy-to-understand.** Language and content style must target end users, avoid jargon, but use SDL Tridion terminology as appropriate  | (not an easy task for sure, but "component" and "building blocks" are preferred over generic terms)  |
| 5  | **Maintainable format.** Documentation and content must be easily maintained by a user familiar with HTML.  | HTML, XML, or configuration-type setup would be ok. Avoid hard-coding content in classes or source code. |
| 6  | **Intuitive/easy-to-update.** The implementation must be set up to make it clear where to add PowerTools information | A help system isn't helpful if it makes it hard for developers to add the help info! |
| 7  | **Consistent.** The order of the help must match the order of the PowerTools buttons. PowerTools that don't have a button in the dashboard should be listed first. | Ideally the order should be easily maintained. |
| 8  | **Connected.** Must include "easy" ways for end users to submit PowerTools feedback such as bug submission, free-form feedback, or questions on the tool | This doesn't have to be fancy, but can include links to the Flow Dock, social media buttons, an email address, the code repository site (Google Code), and/or a link to the discussion group.  |
| 9  | **Seamless.** If/when the PowerTools include an installer, consider incorporating this help information along-side or into the CME help system.  | Possible? Desirable? Consider low-priority until ComponentSynchronizer and PagePublisher are at least done (revisit 2012 Q2). |
| 10 | **Familiar.** The information organization should match the CME help structure if possible or the help system of well-known systems (Windows or Microsoft help) | Though Linux man pages may be "well-known," considering Tridion customer's typicall have Macs or Windows, it might be safer to follow them instead of the help system of a favorite distro. |
| 11 ||  **Easy-to-find.** Offer help button on each PowerTool (i.e. top-right corner) to show individual tool instructions. Automatically show the first time an opened the tool and offer option to not show again.|

# Design #
See ![https://powertools.flowdock.com/flows/main/files/bdfc25f006a1012f0b94406186bed0a3/PowerTools_Help_Mockup_v2.png](https://powertools.flowdock.com/flows/main/files/bdfc25f006a1012f0b94406186bed0a3/PowerTools_Help_Mockup_v2.png)

Also:
https://docs.google.com/drawings/d/1yY4d6XU01r_kYW--yCIQ7Dk0LUL-qVKF0Gc15haLptw/edit?pli=1