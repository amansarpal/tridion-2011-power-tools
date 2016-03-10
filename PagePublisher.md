# Introduction #
Publish pages in batches in a more friendly way.

Should this tool allow publish, based on a template?

This tools was not identified as a priority in a first round (search replaces some PagePublisher functionality, but after multiple requests and proper debate, the priority was raised due to:
progress visualization, status, and smaller transport package features are still useful.

The initial difficulty was not very high, but the real difficulty will depend on the number of extra functionalities implemented.

# Details #


## Description ##

This tool allows the user to launch all the pages contained in a publication or structure group. The main difference with the normal publication is that items are sent to the publishing queue as individual transactions, therefore allowing to identify those that are failing and not blocking the whole publication job, in case that an item fails.

## Audience ##
admin, developer and power user


**Version #**
0.1

Original release date
TBD

Last updated
TBD

**Compatibility**
SDL Tridion 2009 (deprecated)
SDL Tridion 2011 SP1

**Contributor(s)**
{list contributors}

**Document Author(s)**
{list authors}

## Purpose ##
Describe purpose, objectives, and requirements

## Installation ##
{describe installation steps}

### Upgrade ###
{as applicable}
Removal Instructions

# Requirements #
| ID | Description | Scope | Comments |
|:---|:------------|:------|:---------|
| 1  |The publish page tool should be able to publish all the pages contained inside a Structure group or publication .|       |          |
| 2  |The tool will have an option (checkbox), which if marked, will publish all pages inside a Structure group or publication, and go trough all children publications recursively, publishing all the pages contained in them. |       |          |
| 3  |The tool will have the option to publish to the different target types|       |          |
| 4  |Target types dont need to be configured, the tool will retrieve automatically the existing target types|       |          |
| 5  |The tool will have the option to set the publish priority|       |          |
| 6  |The tool will have an advanced options tab, containing an option to publish in child publications|       |          |
| 7  |The tool will have an advanced options tab, containing an option to just render the page, but not publish it|This allows to detect templating errors while not actually publishing anything|          |
| 8  |The tool will have an advanced options tab, containing an option to publish only those pages which are already published to a target, and will allow the user to choose that target from a list|       |          |

## Diagrams ##

<a href='Hidden comment: 
Add a fake QueryString paramater below to make the generated image show (e.g. &faked=fake.png).
'></a>

![http://www.websequencediagrams.com/cgi-bin/cdraw?lz=ClBhZ2UvVXNlciAtPiBKYXZhU2NyaXB0OnJlcXVlc3Q_CgAKCiAtPiBXZWIgU2VydmljZTpvYmplY3Q_CgAJCwATECBDb3JlL0NNRQAVEABfCyAAQgYgcmV0dXJuZWQAYxBEb206IG1hbmlwdWxhdGVzCkRvbSAtPiAAgTEJOiBzaG93IHVwZAAaBQ&s=default&faked=fake.png](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=ClBhZ2UvVXNlciAtPiBKYXZhU2NyaXB0OnJlcXVlc3Q_CgAKCiAtPiBXZWIgU2VydmljZTpvYmplY3Q_CgAJCwATECBDb3JlL0NNRQAVEABfCyAAQgYgcmV0dXJuZWQAYxBEb206IG1hbmlwdWxhdGVzCkRvbSAtPiAAgTEJOiBzaG93IHVwZAAaBQ&s=default&faked=fake.png)

Update the diagram on [WebSequenceDiagrams](http://www.websequencediagrams.com/?lz=ClBhZ2UvVXNlciAtPiBKYXZhU2NyaXB0OnJlcXVlc3Q_CgAKCiAtPiBXZWIgU2VydmljZTpvYmplY3Q_CgAJCwATECBDb3JlL0NNRQAVEABfCyAAQgYgcmV0dXJuZWQAYxBEb206IG1hbmlwdWxhdGVzCkRvbSAtPiAAgTEJOiBzaG93IHVwZAAaBQ&s=default) (will need to update these links)