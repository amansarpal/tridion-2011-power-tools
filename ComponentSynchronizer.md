# Background #
The Component Synchronizer tool helps admins update components to match schema changes.

|Original Developers|Priority|Status|Notes|
|:------------------|:-------|:-----|:----|
|Willem-Jan van den Bichelaer & Quirijn Slings|High priority| GUI done. Service pending. | Hard.|

|Follow-up Research and Implementation(s)|Additional Developers|Status|
|:---------------------------------------|:--------------------|:-----|
|Context Menu on Schema                  |Jaime Santos Alcon, Dominic Cronin| GUI approach with prototype component created (Jaime). Service in command-line script done (Dominic). |

**Contents**


**Version #**
0.1

# 1. User Requirements #

| _ID_ | _Description_ |
|:-----|:--------------|
|  UR 1  **Access** | Only admins can run the tool   |

# 2. Functional Requirements #

Section 2 organizes functional requirements into the following sections.
  * Glossary
  * 2.1 Input
  * 2.2 Logic
  * 2.3 UI, Reporting,  and Logs

_Numbering convention: to reduce "dot" separators document hides the first section number. Prefixes help distinguish sections. So 2.1.3.1  becomes "FR 1.3.1" instead._

## Glossary ##

| _Term_ | _Definition or Details_ |
|:-------|:------------------------|
| **CME** | Content Manager Explorer |
| **FR** | Functional Requirement  |
| **Reference Component** | A user-selected/created Component  with default field values |
| **Synchronization** | Process of confirming, updating, and/or removing (validating) each target component field against its (updated) schema. Non-synchronized components are "out-of-sync." |
| **Target Component(s)** | Content the tool will update. Assumes all matching components in a given publication; however, a more sophisticated tool may allow user ability to search or select smaller set of target components. |
| **"Tool"**  | Term for Component Synchronizer, at least in the requirements below. Similar to "system" (e.g. system will...). |
| **User** | Requirements refer to "User" to avoid confusion with "Content Author." CMS administrator use only. |

## 2.1. Input ##
| _ID_ | _Description_ |
|:-----|:--------------|
| FR 1.1  **Publication**  | Tool needs publication context (can be implied by item selection) |
| FR 1.2  **Schema** | User selects schema and runs Tool  via context menu in CME. Advanced options include via component context menu, single component, or component search. |
| FR 1.3 **Default Schema Fields** | User sets default overriding fields. Tool will use a "reference" component. |
| FR 1.3.1 **Override Fields** | User checks which default values override component fields. _Alternative is to assume no override--only use reference component default field values for empty fields._ |
| FR 1.4 **Run-time Requirement** | Fields and schema structure are unknown until tool runs. "Standard" Content XML assumed (namespaces, `<content>`, etc).|

**_Developer(s) should investigate any schema differences between [R5](https://code.google.com/p/tridion-2011-power-tools/source/detail?r=5).3/2009 and 2011_**

## 2.2. Logic ##

| _ID_ | _Description_ |
|:-----|:--------------|
| FR 2.1 **Single Publication Context**  | Tool will synchronize components in a single publication, using the shared schema definition and reference component in the same context. Tool will ignore parent and child items in other publications. |
| FR 2.2 **Stop for Workflow Association** | Tool will warn user and stop if selected schema has an associated workflow definition. User removes association manually. |
| FR 2.3 **Validate Reference Component** | Tool must synchronize or at least warn user and stop process if reference component is out-of-sync. Reference component's schema must match selected schema (likely implicit--only show appropriate components). |
| FR 2.4 **Preserve Defaults** | Tool will set default field values for its fields in target components based on selected schema. Existing values will not be overwritten unless the overwrite (or override) checkbox is checked.|
| FR 2.5 **Remove Old Fields** | Tool will remove invalid nodes and content, mimicking CME update/save/close behavior. Use rollback and history to see old fields. |
| FR 2.6 **Re-order Matched Fields** | If possible, tool will match and fix out-of-order sibling nodes (within same nesting level). For example, tool will fix a "header" field moved up or down in a schema. Tool will ignore "header" fields from different embeddable schema or that are descendents of each other. |
| FR 2.7 **Recover from Single Failure** | Upon individual synchronization failure, tool should do partial update and log failures. |
| FR 2.8 **Ignore Checked-out Target Components** |  Tool should log but not update checked-out components. |
| FR 2.9 **Warn on Multiple-to-Single Field Changes** | Tool should warn user for multiple-to-single selection changes (e.g. selection box or check box to drop-down or radio button). At the minimum, report which components will be or were affected. |
| FR 2.10 **Match CME Behavior** | When in doubt, tool should match CME behavior when user opens, updates, and saves (& closes) a component. |
| FR 2.10.1 **Run XSLT Filter** | Tool should run rich text against the schema XSLT filter if possible, mimicking the CME.  |
| FR 2.10.2 **No Changes** | Tool should ignore changes to allowed formatting / allowed style. |

## 2.3. UI, Reporting,  and Logs ##

| _ID_ | _Description_ |
|:-----|:--------------|
| FR 3.1 **Report Successes** | Tool should display (aggregated) progress and successful updates (e.g. 90 out of 100 components successfully updated). |
| FR 3.2 **Log Individual Failures** | Tool must capture tcm id and problem field(s)  or error for individual failures.  |
| FR 3.3 **Log Checked-out Items** | Tool must report tcm id for checked-out items either before or after synchronization. |
| FR 3.4 **Log Data Loss** | Tool should remind users which components to revisit due to multiple-to-single field selection data loss (per FR 2.9). |
| FR 3.5 **Prominent Warning** | Text TBD. Tool should warn user about data loss and recommend precautions such as content porting, running only on dev, etc.  |

# 3. Other Considerations #
  * Richtext-to-plain text?
  * Min/Max and schema attributes?

# 4. Technical Requirements #

## 4.1 High-level approach ##

  * Component Synchronizer will use PowerTools (MVC) framework
    * Client-side code make calls to Component Synchronizer  service
    * Service
      * Uses Core Service API for pre-synchronization validations and business logic
      * Uses XSLT for bulk of transformation, recursively evaluating schema field definitions against target component fields
      * Returns updates to client asynchronously
  * Issues saved to CM log files or presented to user in save-able format

## 4.2 Diagram ##
![http://www.websequencediagrams.com/cgi-bin/cdraw?lz=UGFnZS9Vc2VyIC0-IEphdmFTY3JpcHQ6cmVxdWVzdAoACQogLT4gV2ViIFNlcnZpY2U6KHNlcmlhbGl6ZWQpIG9iamVjdAphY3RpdmF0ZQAdDAoAKgsANBAgQ29yZS9DTUUACB10cmFuc2Zvcm0gY29tcG9uZW50cwBGEACBMAsAgQUUZGUAgQYVAIFQDkRvbTogbWFuaXB1bGF0ZXMKRG9tIC0-IACCGwk6IHNob3cgcmVzdWx0cyBhbmQgbG9n&s=default&faked=fake.png](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=UGFnZS9Vc2VyIC0-IEphdmFTY3JpcHQ6cmVxdWVzdAoACQogLT4gV2ViIFNlcnZpY2U6KHNlcmlhbGl6ZWQpIG9iamVjdAphY3RpdmF0ZQAdDAoAKgsANBAgQ29yZS9DTUUACB10cmFuc2Zvcm0gY29tcG9uZW50cwBGEACBMAsAgQUUZGUAgQYVAIFQDkRvbTogbWFuaXB1bGF0ZXMKRG9tIC0-IACCGwk6IHNob3cgcmVzdWx0cyBhbmQgbG9n&s=default&faked=fake.png)


<a href='Hidden comment: 
Add a fake QueryString paramater above to make the generated image show (e.g. &faked=fake.png).

Update the diagram on [http://www.websequencediagrams.com/?lz=UGFnZS9Vc2VyIC0-IEphdmFTY3JpcHQ6cmVxdWVzdAoACQogLT4gV2ViIFNlcnZpY2U6KHNlcmlhbGl6ZWQpIG9iamVjdAphY3RpdmF0ZQAdDAoAKgsANBAgQ29yZS9DTUUACB10cmFuc2Zvcm0gY29tcG9uZW50cwBGEACBMAsAgQUUZGUAgQYVAIFQDkRvbTogbWFuaXB1bGF0ZXMKRG9tIC0-IACCGwk6IHNob3cgcmVzdWx0cyBhbmQgbG9n&s=default WebSequenceDiagrams] (will need to update these links)
'></a>

## 4.3 Existing Code ##
_Please review [previous PowerTools](http://www.sdltridionworld.com/community/extension_overview/powertools.aspx) code for sample XSLT code and validations. Update this wiki page with issues and additional requirements._

# 5. UI #

Peter Kjaer merged Jaime's changes into \trunk. This branch addresses the following.

  * RTF fields rely on the Ribbon Tool bar (it's where the RTF tools are shown) and the tool would have to implement it.
  * Existing extensions won't be available in the tool, unless they would be implemented.
  * Re-use existing the Component View that copies with all the requirements for Content Creation

Approach uses the Component View for content creation, meaning that when I want to synchronize content based on a given schema, the Power User will have to create a "reference" component, i.e. a Component based on the schema we want to synchronize providing with the reference data, stuff like default values for missing fields, for example.

The user can create a Reference component without using the tool and then browse it from the tool as well. The tool will provide with an option to launch the New Component (reference) creation, though.

### 5.1 Features ###

These UI features are programmed, but only on the UI side. Program the service code next.

First priority:
  * Launch the Component Synchronizer from a Schema

Available, but program in a future release:
  * Launch the Component Synchronizer from a Component (context TBD: either reference component or "to-be-synched" component.)
  * Launch the Component Synchronizer from a Selection (within a list)
  * Launch the Component Synchronizer from a Search, by selecting the results

### 5.2 Screenshots ###

Launch from schema (first priority):

![https://tridion-2011-power-tools.googlecode.com/svn/wiki/images/compsync_2.png](https://tridion-2011-power-tools.googlecode.com/svn/wiki/images/compsync_2.png)

Launch from search results (optional):

![https://tridion-2011-power-tools.googlecode.com/svn/wiki/images/compsync_1.png](https://tridion-2011-power-tools.googlecode.com/svn/wiki/images/compsync_1.png)