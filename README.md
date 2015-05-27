axolotl
=======

Minimum and efficient  documentation system for sysadmins.

**ax**oltl   
d**O**cumentation   
**L**ibre, organized and   
**T**agged 
in p**L**ain text

Document example
================

![](https://circulosmeos.files.wordpress.com/2015/03/axolotl_example_extract.png)

Usually, I create a document per day for common tasks, with name format YYYYMMDD.txt.
But also separate files with tasks names can be created.

See [http://wp.me/p2FmmK-7E](https://circulosmeos.wordpress.com/2015/03/04/axolotl-a-simple-plain-text-documentation-system/).

You can also download the project and open this page on your browser in order to take a glimpse of a documentation text file as seen by an axolotl "properly instructed" editor: "axolotl doc.html"

Brief Description
=================

Plain text is in most cases an enough documentation approach to any activity.

Only some minimum conventions are required to create metadata and visual clues, both visually enhanced by the text editor. 

Date convention is **YYYYMMDD** ([ISO 8601](http://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) Calendar dates in *basic format*).

Files are stored with the date of the day as name in format YYYYMMDD.txt

This way an efficient and quick documentation system is developed with these features:
* quick and productive documentation of tasks 
* searchs by keywords
* visual clues to documentation
* a standard way for documentation interchange (common keywords, date and author conventions)

See [http://wp.me/p2FmmK-7E](https://circulosmeos.wordpress.com/2015/03/04/axolotl-a-simple-plain-text-documentation-system/) for more details.

Installation
============

Files for both keybindings and color highlighting are presented, for these editors:

* [Sublime Text 3](https://github.com/circulosmeos/axolotl/tree/master/Sublime%20Text%203)
* [Editplus 3](https://github.com/circulosmeos/axolotl/tree/master/Editplus%203)

Description of the documentation system
=======================================

Plain text (UTF-8) is (usually) enough for any documentation activity.

These marks, keybindings and color highlighting are used with the help of the text editor:

* names between double brackets represent metadata tags (highlighted as green color)   
    [[circulosmeos]] [[20141127]] [[ntfs]] [[incident]]   
  The beginning of the metadata line is a heading specifying author (initials or alias) and date: 
    [[circulosmeos]] [[20141127]]   
  *Alt+2* keybind automatically creates this author+date heading. 
  NOTE: if you use the code for Sublime Text, change your name in "circulosmeos Insert Preformatted Texts.py", by replacing the text "place your name here!".
  *Alt+6* inserts [[]] with the cursor between the brackets.   
  *F5* inserts actual date in ISO 8601 basic format.   
Next tags are keywords of that specific task.   
This way, it is possible to search by keywords in the documentation.   
In common environments, just 20 to 50 keywords are needed to tag every task in the whole documentation historic archive.   


* repeated characters are used as dividers between different parts of the document or to enclose certain blocks:
	* task divider: 79x '-' (cranberry color) (*Alt+1*)    

	 -------------------------------------------------------------------------------   
	* activity divider inside a task: 49x '.' (yellow color) (*Alt+3*)   
	.................................................   
	* divider that opens and closes a literal block of text: 24x '+' (yellow color) (*Alt+4*)   
	++++++++++++++++++++++++   
	++++++++++++++++++++++++   

* paths or hints are indicated between **<** and **>** in order to mark external or attached resources (yellow color) (*Alt+8*)    
&lt;screen capture of my error.png&gt;, &lt;https://github.com/circulosmeos/axolotl&gt;   

* visually striking sets for some common tasks, which are repeated (these can be easily found using Sublime's minimap):  
(((DOCUMENTATION_PENDING)))   
(((DOCUMENTATION_PENDING)))   
(((DOCUMENTATION_PENDING)))   
*Alt+5* for one line of this.   
--- PENDING ------ PENDING ------ PENDING ------ PENDING ---   
--- PENDING ------ PENDING ------ PENDING ------ PENDING ---   
--- PENDING ------ PENDING ------ PENDING ------ PENDING ---   
*Alt+7* for one line of this.

License
=======

Distributed [under GPL 3](http://www.gnu.org/licenses/gpl-3.0.html)
